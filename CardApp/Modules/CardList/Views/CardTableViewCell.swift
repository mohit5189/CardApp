import UIKit
import SnapKit

private struct Constants {
    static let height: CGFloat = 240.0
}

final class CardTableViewCell: UITableViewCell {
    private var cardSlidingView: CardSlidingView
    var cellIndex: Int {
        didSet {
            cardSlidingView.cellIndex = cellIndex
        }
    }
    weak var delegate: CardSlidingViewProtocol? {
        didSet {
            cardSlidingView.delegate = delegate
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        cardSlidingView = CardSlidingView(frame: .zero)
        cellIndex = 0
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cardSlidingView)
        adjustSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func adjustSubViews() {
        selectionStyle = .none
        backgroundColor = .clear
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        cardSlidingView.snp.makeConstraints {
            $0.height.equalTo(Constants.height)
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateCell(_ model: CardListModel) {
        cardSlidingView.updateCardView(cardModel: model)
    }
    
    func resetCardView() {
        cardSlidingView.resetCardView()
    }
    
    func animateView() {
        cardSlidingView.animateView()
    }
}
