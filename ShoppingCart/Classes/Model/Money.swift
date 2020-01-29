import Foundation

typealias Money = Decimal

extension Money {
    func asString() -> String {
        return "\(self)"
    }
}