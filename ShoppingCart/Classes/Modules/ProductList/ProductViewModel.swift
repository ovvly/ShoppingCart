import Foundation

protocol ProductViewModel {
    var name: String { get }
    var unit: String { get }
    var price: String { get }
    var amount: String { get }
    func amountIncreased()
    func amountDecreased()
}

final class DefaultProductViewModel: ProductViewModel {
    let name: String
    let unit: String
    let price: String

    var amount: String {
        return String(numberOfUnits)
    }

    private var numberOfUnits: Int

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