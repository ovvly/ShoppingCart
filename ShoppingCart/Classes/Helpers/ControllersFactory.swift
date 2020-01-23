import Foundation
import UIKit

final class ControllersFactory {
    func createProductListViewController() -> ProductListViewController {
        let products = [ "Peas", "Eggs", "Milk", "Beans"]
        let viewController = ProductListViewController(products: products)
        return viewController
    }
}
