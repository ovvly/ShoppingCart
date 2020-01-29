import Foundation

protocol ProductViewModel {
    var name: String { get }
    var unit: String { get }
    var priceString: String { get }
    var amountString: String { get }
    var totalPrice: Money { get }
    func amountIncreased()
    func amountDecreased()
}

final class DefaultProductViewModel: ProductViewModel {
    let name: String
    let unit: String
    var priceString: String {
       return price.asString()
    }
    var totalPrice: Money {
        return price * Decimal(numberOfUnits)
    }

    var amountString: String {
        return String(numberOfUnits)
    }

    private var numberOfUnits: Int
    private let price: Money

    init(product: Product, amount: Int = 0) {
        self.name = product.name
        self.unit = product.unit
        self.price = product.price
        self.numberOfUnits = amount
    }

    func amountIncreased() {
        numberOfUnits += 1
    }

    func amountDecreased() {
        guard numberOfUnits > 0 else { return }
        numberOfUnits -= 1
    }
}