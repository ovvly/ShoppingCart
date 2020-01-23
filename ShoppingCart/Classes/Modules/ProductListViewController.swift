import Foundation
import UIKit

final class ProductListViewController: UIViewController {
    private let products = [ "Peas", "Eggs", "Milk", "Beans"]
    private let tableView = UITableView()
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.dataSource = self
    }
    
    private struct Constants {
        static let cellIdentifier = "ProductCell"
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) else {
            fatalError("Failed to dequeue table view cell with identifier: \(Constants.cellIdentifier)")
        }
        cell.textLabel?.text = product
        return cell
    }
}
