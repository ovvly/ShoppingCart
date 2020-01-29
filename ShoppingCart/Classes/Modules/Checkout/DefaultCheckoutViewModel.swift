import Foundation

protocol CheckoutViewModel {
    var priceString: String { get }
    func update(currency: String, rate: Decimal)
}

final class DefaultCheckoutViewModel: CheckoutViewModel {
    var priceString: String

    private let price: Money

    init(price: Money) {
        self.price = price
        self.priceString = "\(price.asString()) USD"
    }

    func update(currency: String, rate: Decimal) {
       priceString = "\(price * rate) \(currency)"
    }
}