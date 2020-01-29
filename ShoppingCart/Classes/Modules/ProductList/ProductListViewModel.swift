import Foundation

protocol ProductListViewModel {
    var productsCount: Int { get }
    var totalPrice: Money { get }
    func viewModel(for index: Int) -> ProductViewModel
}

final class DefaultProductListViewModel: ProductListViewModel {
    var productsCount: Int {
        return productViewModels.count
    }
    var totalPrice: Money {
        return productViewModels
                .map { $0.totalPrice }
                .reduce(0, +)
    }

    private let productViewModels: [ProductViewModel]

    init(products: [Product]) {
        productViewModels = products.map { DefaultProductViewModel(product: $0) }
    }

    func viewModel(for index: Int) -> ProductViewModel {
        return productViewModels[index]
    }
}