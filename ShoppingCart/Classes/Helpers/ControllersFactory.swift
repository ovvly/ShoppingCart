import Foundation
import UIKit

final class ControllersFactory {
    func createProductListViewController() -> ProductListViewController {
        let products = [Product(name: "Peas", unit: "bag", price: "$ 0,95"), 
                        Product(name: "Eggs", unit: "dozen", price: "$ 2,10"),  
                        Product(name: "Milk", unit: "bottle", price: "$ 1,30"),
                        Product(name: "Beans", unit: "can", price: "$ 0,73")]
        let viewModel = DefaultProductListViewModel(products: products)

        let viewController = ProductListViewController(viewModel: viewModel)
        return viewController
    }
}
