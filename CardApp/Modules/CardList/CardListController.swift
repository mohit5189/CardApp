import UIKit

protocol CardListPresenterProtocol: AnyObject {
    func didTapCardOption(cardNumber: String, cardOption: CardOption)
}

final class CardListViewController: UIViewController {
    private let moduleView: CardListViewProtocol
    private let interactor: CardListInteractorProtocol
    private let router: CardListRouterProtocol

    init(view: CardListViewProtocol, interactor: CardListInteractorProtocol, router: CardListRouterProtocol) {
        self.moduleView = view
        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        view = moduleView.view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Translations.cardScreenTitle
        moduleView.presentModel(cards: getCards())
    }

    private func getCards() -> [CardListModel] {
        let cardData = [CardListModel(cardNumber: "4315 XXXX XXXX 0001", bgColor: .lightGray,cardImage: #imageLiteral(resourceName: "icici2"), options: [CardOption(title: Translations.cardDetailText), CardOption(title: Translations.patNowText)]),
        CardListModel(cardNumber: "5249 XXXX XXXX 3941", bgColor: .lightGray,cardImage: #imageLiteral(resourceName: "hdfc") ,options: [CardOption(title: Translations.cardDetailText), CardOption(title: Translations.patNowText)]),
        CardListModel(cardNumber: "5241 XXXX XXXX 1001", bgColor: .lightGray, cardImage: #imageLiteral(resourceName: "icici1"), options: [CardOption(title: Translations.cardDetailText), CardOption(title: Translations.patNowText)]),
        CardListModel(cardNumber: "4315 XXXX XXXX 0001", bgColor: .lightGray, cardImage: #imageLiteral(resourceName: "icici2") ,options: [CardOption(title: Translations.cardDetailText), CardOption(title: Translations.patNowText)])]
        return cardData
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moduleView.animateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardListViewController: CardListPresenterProtocol {
    func didTapCardOption(cardNumber: String, cardOption: CardOption) {
        router.showAlert(cardNumber: cardNumber, cardOption: cardOption)
    }
}
