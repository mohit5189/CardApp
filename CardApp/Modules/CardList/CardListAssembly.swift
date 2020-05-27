import UIKit
import Swinject
import SwinjectAutoregistration

final class CardListAssembly {
    private let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func module(closeCompletion: VoidHandler? = nil) -> UIViewController {
        let view = resolver.resolve(CardListViewProtocol.self)!
        let interactor = resolver.resolve(CardListInteractorProtocol.self)!
        let router = resolver.resolve(CardListRouterProtocol.self)!

        let controller = CardListViewController(view: view, interactor: interactor, router: router)

        router.sourceViewController = controller
        router.closeCompletion = closeCompletion

        view.presenter = controller

        return controller
    }
}

final class CardListDIAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CardListAssembly.self) { CardListAssembly(resolver: $0) }
        container.autoregister(CardListViewProtocol.self, initializer: CardListView.init)
        container.autoregister(CardListInteractorProtocol.self, initializer: CardListInteractor.init)
        container.autoregister(CardListRouterProtocol.self, initializer: CardListRouter.init)
    }
}
