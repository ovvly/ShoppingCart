import Foundation
import UIKit

final class FlowController {
    private let controllersFactory = ControllersFactory()
    private let navigationController: UINavigationController

    private weak var checkoutViewController: CheckoutViewController?

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
        self.checkoutViewController = checkoutViewController
        checkoutViewController.delegate = self
        navigationController.pushViewController(checkoutViewController, animated: true)
    }
}

extension FlowController: CheckoutViewControllerDelegate {
    func userSelectsCurrencyChange() {
        let currencySelectionViewController = controllersFactory.createCurrencySelectionViewController()
        currencySelectionViewController.delegate = self
        navigationController.pushViewController(currencySelectionViewController, animated: true)
    }
}

extension FlowController: CurrencySelectionViewControllerDelegate {
    func selected(currency: Currency, rate: CurrencyRate) {
        navigationController.popViewController(animated: true)
        checkoutViewController?.selected(currency: currency, rate: rate)
    }
}