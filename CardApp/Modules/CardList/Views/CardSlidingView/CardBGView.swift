
import UIKit

private struct Constants {
    static let cornerRadius: CGFloat = 10.0
}

enum Alignment {
    case left
    case right
    case none
}

protocol CardBGViewProtocol: class {
    func didTapCardOption(cardNumber: String, cardOption: CardOption)
}
final class CardBGView: UIView {
    weak var delegate: CardBGViewProtocol?
    private var stackView: UIStackView
    private var currentAlignment: Alignment = .none
    private var cardListModel: CardListModel?
    
    override init(frame: CGRect) {
        stackView = UIStackView()
        super.init(frame: frame)
        addSubview(stackView)
        layer.cornerRadius = Constants.cornerRadius
        adjustSubViews()
    }
    
    private func adjustSubViews() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalTo(0)
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCardView(cardModel: CardListModel) {
        backgroundColor = cardModel.bgColor
        cardListModel = cardModel
        stackView.removeAllArrangedSubviews()
        
        var buttonTag = 0
        for option in cardModel.options {
            let button = UIButton(type: .custom)
            button.setTitle(option.title, for: .normal)
            button.tag = buttonTag
            button.addTarget(self, action: #selector(didTapOption), for: .touchUpInside)
            buttonTag += 1
            stackView.addArrangedSubview(button)
        }
    }
    
    func setButtonAlignment(alignment: Alignment) {
        if alignment != currentAlignment {
            currentAlignment = alignment
            switch alignment {
            case .left:
                setStackConstraints(left: 0, right: frame.width / 2)
            case .right:
                setStackConstraints(left: frame.width / 2, right: 0)
            default:
                break
            }
        }
    }
    
    private func setStackConstraints(left: CGFloat, right: CGFloat) {
        stackView.snp.updateConstraints {
            $0.leading.equalToSuperview().inset(left)
            $0.trailing.equalToSuperview().inset(right)
        }
    }
    
    @objc private func didTapOption(button: UIButton) {
        delegate?.didTapCardOption(cardNumber: cardListModel?.cardNumber ?? "", cardOption: cardListModel?.options[button.tag] ?? CardOption(title: ""))
    }
}
