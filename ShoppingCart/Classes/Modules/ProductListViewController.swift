import Foundation
import UIKit

final class ProductListViewController: UIViewController {
    private let viewModel: ProductListViewModel
    private let productListView = ProductListView()

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Used unimplemented initializer")
    }
    
    override func loadView() {
        view = productListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        productListView.tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        productListView.tableView.dataSource = self
        productListView.tableView.tableFooterView = UIView()
        productListView.tableView.rowHeight = 100
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.productsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell else {
            fatalError("Failed to dequeue table view cell with identifier: \(ProductCell.identifier)")
        }

        let productViewModel = viewModel.viewModel(for: indexPath.row)
        cell.populate(with: productViewModel)

        return cell
    }
}

private extension ProductCell {
    func populate(with viewModel: ProductViewModel) {
        productNameLabel.text = viewModel.name
        unitLabel.text = viewModel.unit
        priceLabel.text = viewModel.price
        amountLabel.text = viewModel.amount

        increaseAction = { [unowned self] in
            viewModel.amountIncreased()
            self.amountLabel.text = viewModel.amount
        }

        decreaseAction = { [unowned self] in
            viewModel.amountDecreased()
            self.amountLabel.text = viewModel.amount
        }
    }
}
