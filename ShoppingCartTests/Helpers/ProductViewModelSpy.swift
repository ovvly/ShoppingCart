import Foundation
@testable import ShoppingCart

final class ProductViewModelSpy: ProductViewModel {
    let totalPrice: Money = 42.0
    var increaseCalled = 0
    var decreaseCalled = 0

    var name: String = ""
    var unit: String = ""
    var priceString: String = ""
    var amountString: String = ""

    func amountIncreased() {
        increaseCalled += 1
    }
    func amountDecreased() {
        decreaseCalled += 1
    }
}