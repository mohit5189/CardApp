import UIKit
import SnapKit

protocol CardListViewProtocol: AnyView {
    var presenter: CardListPresenterProtocol? { get set }
    func presentModel(cards: [CardListModel])
    func animateView()
}

final class CardListView: UIView {
    weak var presenter: CardListPresenterProtocol?
    private var currentCardIndex = 0
    
    private var tableView: UITableView
    private var cards: [CardListModel] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView()
        cards = []
        super.init(frame: frame)
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        adjustSubviews()
    }

    private func adjustSubviews() {
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: "CardTableViewCell")
        tableView.separatorStyle = .none
        backgroundColor = .black
        tableView.backgroundColor = .clear
        setUpConstraints()
    }

    private func setUpConstraints() {
        tableView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(0)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardListView: CardListViewProtocol {
    func presentModel(cards: [CardListModel]) {
        self.cards = cards
    }
    
    func animateView() {
        guard let cell = tableView.cellForRow(at: IndexPath(row: currentCardIndex, section: 0)) as? CardTableViewCell else { return }
        cell.animateView()
    }
}

extension CardListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell") as? CardTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCell(cards[indexPath.row])
        cell.delegate = self
        cell.cellIndex = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension CardListView: CardSlidingViewProtocol {
    func didChangeState(index: Int) {
        if currentCardIndex != index {
            guard let cell = tableView.cellForRow(at: IndexPath(row: currentCardIndex, section: 0)) as? CardTableViewCell else { return }
            cell.resetCardView()
            currentCardIndex = index
        }
    }
    
    func didTapCardOption(cardNumber: String, cardOption: CardOption) {
        presenter?.didTapCardOption(cardNumber: cardNumber, cardOption: cardOption)
    }
}

extension CardListView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let cell = tableView.cellForRow(at: IndexPath(row: currentCardIndex, section: 0)) as? CardTableViewCell else { return }
        cell.resetCardView()
        currentCardIndex = 0
    }
}
