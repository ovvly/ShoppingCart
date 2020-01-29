import Foundation
import UIKit

protocol CurrencySelectionViewControllerDelegate: class {
    func selected(currency: Currency, rate: CurrencyRate)
}

final class CurrencySelectionViewController: UIViewController {
    weak var delegate: CurrencySelectionViewControllerDelegate?

    private let viewModel: CurrencySelectionViewModel
    private let tableView = UITableView()

    init(viewModel: CurrencySelectionViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Used unimplemented initializer")
    }

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.identifier)

        fetchCurrencies()
    }

    private func fetchCurrencies() {
        //TODO: add loading indicator
        viewModel.fetchCurrencies(completion: { [weak self] result in
            switch result {
                case .success:
                    self?.tableView.reloadData()
                case .failure:
                    //TODO: add error handling
                    self?.tableView.reloadData()
            }
        })
    }
}

extension CurrencySelectionViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.fetchRate(for: indexPath.row) { [weak self] result in
            switch result {
                case .failure:
                    //TODO: add error handling
                    print("failed to fetch currency rate")
                    return
                case .success(let currency, let rate):
                    self?.delegate?.selected(currency: currency, rate: rate)
            }
        }
    }
}

extension CurrencySelectionViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCurrencies
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier) as? CurrencyCell else {
            fatalError("Failed to dequeue table view cell with identifier: \(CurrencyCell.identifier)")
        }

        let currency = viewModel.currency(for: indexPath.row)
        cell.textLabel?.text = currency
        return cell
    }
}