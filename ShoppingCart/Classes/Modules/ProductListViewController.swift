import Foundation
import UIKit

final class ProductListViewController: UIViewController {
    private let products: [Product]
    private let tableView = UITableView()
    
    init(products: [Product]) {
        self.products = products
        
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
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        tableView.dataSource = self
        tableView.rowHeight = 44
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell else {
            fatalError("Failed to dequeue table view cell with identifier: \(ProductCell.identifier)")
        }
        
        cell.productNameLabel.text = product.name
        cell.unitLabel.text = "per \(product.unit)"
        cell.priceLabel.text = product.price
        return cell
    }
}
