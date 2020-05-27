
import UIKit
import SnapKit

private struct Constants {
    static let cornerRadius: CGFloat = 10.0
}

class CardView: UIView {
    private var cardImage: UIImageView
    
    override init(frame: CGRect) {
        cardImage = UIImageView()
        super.init(frame: frame)
        addSubview(cardImage)
        layer.cornerRadius = Constants.cornerRadius
        adjustSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func adjustSubviews() {
        cardImage.contentMode = .scaleAspectFill
        clipsToBounds = true
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        cardImage.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func updateCardView(cardModel: CardListModel) {
        cardImage.image = cardModel.cardImage
    }
}
