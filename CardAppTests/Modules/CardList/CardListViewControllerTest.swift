import XCTest
import Swinject
import Cuckoo
@testable import CardApp

final class CardListViewControllerTest: XCTestCase {
    private var container: Container!
    private var viewController: CardListViewController!

    private var mockView: MockCardListViewProtocol!
    private var mockInteractor: MockCardListInteractorProtocol!
    private var mockRouter: MockCardListRouterProtocol!

    override func setUp() {
        super.setUp()

        container = Container()
        container.autoregister(CardListViewProtocol.self, initializer: MockCardListViewProtocol.init).inObjectScope(.container)
        container.autoregister(CardListInteractorProtocol.self, initializer: MockCardListInteractorProtocol.init).inObjectScope(.container)
        container.autoregister(CardListRouterProtocol.self, initializer: MockCardListRouterProtocol.init).inObjectScope(.container)

        container.autoregister(CardListViewController.self, initializer: CardListViewController.init).inObjectScope(.container)

        viewController = container.resolve(CardListViewController.self)

        mockView = container.resolve(CardListViewProtocol.self) as? MockCardListViewProtocol
        mockInteractor = container.resolve(CardListInteractorProtocol.self) as? MockCardListInteractorProtocol
        mockRouter = container.resolve(CardListRouterProtocol.self) as? MockCardListRouterProtocol
    }

    override func tearDown() {
        container.resetObjectScope(ObjectScope.container)
        container = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(viewController, "controller to test should not be nil")
    }

    // Please add tests for CardListViewController's functions
}
