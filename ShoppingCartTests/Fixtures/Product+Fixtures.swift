import Foundation
@testable import ShoppingCart

extension Product {
    static var fixtures: [Product] {
        return [Product(name: "Fixture 1", unit: "unit 1", price: 1),
                Product(name: "Fixture 2", unit: "unit 2", price: 10)]
    }

    static var fixture: Product {
        return Product(name: "Fixture 1", unit: "unit 1", price: 42)
    }
}
