import Foundation
import UIKit

final class ControllersFactory {
    func createProductListViewController() -> ProductListViewController {
        let products = [Product(name: "Peas", unit: "bag", price: 0.95), 
                        Product(name: "Eggs", unit: "dozen", price: 2.10),  
                        Product(name: "Milk", unit: "bottle", price: 1.30),
                        Product(name: "Beans", unit: "can", price: 0.73)]
        let viewModel = DefaultProductListViewModel(products: products)

        let viewController = ProductListViewController(viewModel: viewModel)
        return viewController
    }

    func createCheckoutViewController(price: Money) -> CheckoutViewController {
        let viewModel = DefaultCheckoutViewModel(price: price)
        let viewController = CheckoutViewController(viewModel: viewModel)
        return viewController
    }

    func createCurrencySelectionViewController() -> CurrencySelectionViewController {
        let currenciesService = CurrenciesNetworkService()
        let rateService = CurrencyRateNetworkService()
        let viewModel = CurrencySelectionViewModel(currenciesService: currenciesService, rateService: rateService)
        let viewController = CurrencySelectionViewController(viewModel: viewModel)
        return viewController
    }
}
