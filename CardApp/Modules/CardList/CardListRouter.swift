import UIKit

protocol CardListRouterProtocol: RouterProtocol {
    func showAlert(cardNumber: String, cardOption: CardOption)
}

final class CardListRouter: Router, CardListRouterProtocol {

    func showAlert(cardNumber: String, cardOption: CardOption) {
        let alert = UIAlertController(title: cardNumber, message: cardOption.title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        sourceViewController?.present(alert, animated: true, completion: nil)
    }
}
