import UIKit

private struct Constants {
    static let sideMargin: CGFloat = 20.0
    static let height: CGFloat = 200.0
}

enum CardState {
    case leftSwiped
    case rightSwiped
    case normal
}

protocol CardSlidingViewProtocol: class {
    func didTapCardOption(cardNumber: String, cardOption: CardOption)
    func didChangeState(index: Int)
}

final class CardSlidingView: UIView {
    weak var delegate: CardSlidingViewProtocol?
    var cellIndex: Int

    private var cardView: CardView
    private var cardBGView: CardBGView
    private var currentLeadingCoordinate: CGFloat = Constants.sideMargin
    private var currentCardState: CardState = .normal {
        didSet {
            switch currentCardState {
            case .leftSwiped:
                animate(xCoord: -(frame.size.width / 2) + Constants.sideMargin * 2)
                cardBGView.setButtonAlignment(alignment: .right)
            case .rightSwiped:
                animate(xCoord: frame.size.width / 2)
                cardBGView.setButtonAlignment(alignment: .left)
            case .normal:
                animate(xCoord: Constants.sideMargin)
            }
        }
    }
    
    override init(frame: CGRect) {
        cardView = CardView(frame: .zero)
        cardBGView = CardBGView(frame: .zero)
        cellIndex = 0
        super.init(frame: frame)
        addSubview(cardBGView)
        addSubview(cardView)
        adjustSubviews()
    }
    
    private func adjustSubviews() {
        backgroundColor = .clear
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(detectPan(recognizer:)))
        panGesture.delaysTouchesBegan = true
        panGesture.delaysTouchesEnded = false
        cardView.addGestureRecognizer(panGesture)
        cardBGView.delegate = self
        
        setUpConstraints()
    }
    
    func setCardState(_ cardState: CardState) {
        currentCardState = cardState
    }
    
    private func setUpConstraints() {
        cardBGView.snp.makeConstraints {
            $0.height.equalTo(Constants.height)
            $0.leading.trailing.top.bottom.equalToSuperview().inset(Constants.sideMargin)
        }
        
        cardView.snp.makeConstraints {
            $0.height.equalTo(Constants.height)
            $0.leading.trailing.top.bottom.equalToSuperview().inset(Constants.sideMargin)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCardView(cardModel: CardListModel) {
        cardView.updateCardView(cardModel: cardModel)
        cardBGView.updateCardView(cardModel: cardModel)
    }
}

// MARK: PAN Gesture handling
extension CardSlidingView {
    @objc private func detectPan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            currentLeadingCoordinate = cardView.frame.origin.x
        case .changed:
            let translation = recognizer.translation(in: self)
            if shouldAllowGesture(translation: translation) {
                cardView.snp.updateConstraints {
                    $0.leading.equalToSuperview().inset(currentLeadingCoordinate + translation.x)
                    $0.trailing.equalToSuperview().inset(Constants.sideMargin * 2 - (currentLeadingCoordinate + translation.x))
                }
                
                // Set background view alignment as per sliding position
                
                if (currentLeadingCoordinate + translation.x) <= 0 {
                    cardBGView.setButtonAlignment(alignment: .right)
                } else {
                    cardBGView.setButtonAlignment(alignment: .left)
                }
            }
        case .ended:
            let translation = recognizer.translation(in: self)
            changeState(isLeftSwipe: translation.x < 0)

        default:
            break
        }
    }
    
    private func shouldAllowGesture(translation: CGPoint) -> Bool {
        if translation.x >= 0 {
            return (currentLeadingCoordinate + translation.x) <= (frame.size.width / 2)
        } else {
            return (frame.size.width / 2) >= -(currentLeadingCoordinate + translation.x)
        }
    }
    
    private func changeState(isLeftSwipe: Bool) {
        if isLeftSwipe, currentCardState != .leftSwiped {
            currentCardState = (currentCardState == .normal) ? .leftSwiped : .normal
        } else if !isLeftSwipe, currentCardState != .rightSwiped {
            currentCardState = (currentCardState == .normal) ? .rightSwiped : .normal
        }
        
        // update current card at view level
        if currentCardState != .normal {
            delegate?.didChangeState(index: cellIndex)
        }
    }
    
    private func animate(xCoord: CGFloat) {
        var trailing = Constants.sideMargin * 2 - xCoord
        if currentCardState == .rightSwiped {
            trailing = Constants.sideMargin - xCoord
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.cardView.snp.updateConstraints {
                $0.leading.equalToSuperview().inset(xCoord)
                $0.trailing.equalToSuperview().inset(trailing)
            }
            self.layoutIfNeeded()
        })
    }
    
    func resetCardView() {
        currentCardState = .normal
    }
    
    func animateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.currentCardState = .leftSwiped
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.currentCardState = .rightSwiped
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.currentCardState = .normal
                }
            }
        }
    }
}

extension CardSlidingView: CardBGViewProtocol {
    func didTapCardOption(cardNumber: String, cardOption: CardOption) {
        delegate?.didTapCardOption(cardNumber: cardNumber, cardOption: cardOption)
    }
}
