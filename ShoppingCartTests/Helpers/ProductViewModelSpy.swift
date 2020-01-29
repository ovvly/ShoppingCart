import Foundation
@testable import ShoppingCart

final class ProductViewModelSpy: ProductViewModel {
    var increaseCalled = 0
    var decreaseCalled = 0

    var name: String = ""
    var unit: String = ""
    var price: String = ""
    var amount: String = ""

    func amountIncreased() {
        increaseCalled += 1
    }
    func amountDecreased() {
        decreaseCalled += 1
    }
}