import Foundation

protocol ProductCellViewModel {
    var initialAmount: String { get }
    var amountChanged: ((String)->())? { get set }
    func amountIncreased()
    func amountDecreased()
}

final class DefaultProductCellViewModel: ProductCellViewModel {
    var amountChanged: ((String)->())?
    var initialAmount: String

    private var amount: Int {
        didSet {
            amountChanged?(String(amount))
        }
    }

    func amountIncreased() {
        amount = amount + 1
    }

    func amountDecreased() {
        guard amount > 0 else { return }
        amount = amount - 1
    }

    init(amount: Int = 0) {
        self.amount = amount
        self.initialAmount = String(amount)
    }
}

final class EmptyProductCellViewModel: ProductCellViewModel {
    var initialAmount: String = "0"
    var amountChanged: ((String)->())?
    func amountIncreased() { }
    func amountDecreased() { }
}