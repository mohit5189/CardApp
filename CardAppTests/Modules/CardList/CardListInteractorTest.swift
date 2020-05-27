import XCTest
import Swinject
import Cuckoo
@testable import CardApp

final class CardListInteractorTest: XCTestCase {

    private var container: Container!
    private var interactor: CardListInteractor!

    override func setUp() {
        super.setUp()

        // Setup Mock dependency injection
        container = Container()
        container.autoregister(CardListInteractorProtocol.self, initializer: CardListInteractor.init)

        /* Please Add CardListInteractor's dependency here.
        * If CardListInteractor's constructor requires an injected Protocol: init(eventService: EventTrackerProtocol)
        * Please add: container.autoregister(EventTrackerProtocol.self, initializer: MockEventTrackerProtocol.init).inObjectScope(.container)
        */

        interactor = container.resolve(CardListInteractorProtocol.self) as? CardListInteractor
    }

    override func tearDown() {
        // Clean up all injected mock objects
        container.resetObjectScope(ObjectScope.container)
        super.tearDown()
    }

    func testCardListInteractorInit() {
        XCTAssertNotNil(interactor)
    }

    // Please add tests for CardListInteractorProtocol's functions
}
