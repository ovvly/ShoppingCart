import Foundation

typealias Money = Decimal

extension Money {
    func asString() -> String {
        return "\(self)"
    }
}

protocol CheckoutViewModel {
    var priceString: String { get }
}

final class DefaultCheckoutViewModel: CheckoutViewModel {
    let priceString: String

    init(price: Money) {
        self.priceString = price.asString()
    }
}