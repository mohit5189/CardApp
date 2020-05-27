import XCTest
import Swinject
import Cuckoo
@testable import CardApp

final class CardListAssemblyTest: XCTestCase {
    func testCardListDIAssembly() {
        // Given DependencyManager is setup to create Assembler with `CardListDIAssembly`
        // When App Assembly set up a dependency
        let sharedResolver = DependencyManager.shared.resolver

        // Then: the container should be able to resolve classes in CardList Module
        let moduleAssembly = sharedResolver.resolve(CardListAssembly.self)!
        let view = sharedResolver.resolve(CardListViewProtocol.self)!
        let interactor = sharedResolver.resolve(CardListInteractorProtocol.self)!
        let router = sharedResolver.resolve(CardListRouterProtocol.self)!
        XCTAssertNotNil(moduleAssembly)
        XCTAssertTrue(view is CardListView)
        XCTAssertTrue(interactor is CardListInteractor)
        XCTAssertTrue(router is CardListRouter)
    }

    // MARK: Test creating connection between interactor, presenter & view
    func testCardListAssembly() {
        var dummyInteractor: MockCardListInteractorProtocol!
        var dummyView: MockCardListViewProtocol!
        var dummyRouter: MockCardListRouterProtocol!

        // Given an Assembly with mock dependency
        let dummyContainer = Container()
        dummyContainer.register(CardListInteractorProtocol.self) { _ in
            dummyInteractor = MockCardListInteractorProtocol()
            return dummyInteractor
        }
        dummyContainer.register(CardListViewProtocol.self) { _ in
            dummyView = MockCardListViewProtocol()
            stub(dummyView) { when($0.presenter.set(any())).thenDoNothing() }
            return dummyView
        }
        dummyContainer.register(CardListRouterProtocol.self) { _ in
            let mockRouter = MockCardListRouterProtocol()
            stub(mockRouter) {
                when($0.sourceViewController.set(any())).thenDoNothing()
                when($0.closeCompletion.set(any())).thenDoNothing()
            }
            dummyRouter = mockRouter
            return dummyRouter
        }

        let moduleAssembly = CardListAssembly(resolver: dummyContainer)

        // When creating controller by the assembly's function
        let presenter = moduleAssembly.module()

        // Then: respective container factory blocks will fire
        XCTAssertTrue(presenter is CardListViewController)
        XCTAssertNotNil(dummyInteractor)
        XCTAssertNotNil(dummyView)
        XCTAssertNotNil(dummyRouter)
        verify(dummyRouter).sourceViewController.set(ParameterMatcher<UIViewController?> { $0 === presenter })
        verify(dummyView).presenter.set(ParameterMatcher<CardListPresenterProtocol?> { $0 as! CardListViewController === presenter })
    }
}
