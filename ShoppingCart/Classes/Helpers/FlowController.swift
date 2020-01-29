import Foundation
import UIKit

final class FlowController {
    private let controllersFactory = ControllersFactory()
    private let navigationController: UINavigationController

    init() {
        let productsListViewController = controllersFactory.createProductListViewController()
        self.navigationController = UINavigationController(rootViewController: productsListViewController)
        productsListViewController.delegate = self
    }

    func rootViewController() -> UIViewController {
        return navigationController
    }
}

extension FlowController: ProductListViewControllerDelegate {
    func userSelectsProducts(with price: Money) {
        let checkoutViewController = controllersFactory.createCheckoutViewController(price: price)
        navigationController.pushViewController(checkoutViewController, animated: true)
    }
}