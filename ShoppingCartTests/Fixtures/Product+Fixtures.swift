import Foundation
@testable import ShoppingCart

extension Product {
    static var fixtures: [Product] {
        return [Product(name: "Fixture 1", unit: "unit 1", price: "price 1"),
                Product(name: "Fixture 2", unit: "unit 2", price: "price 2"),
                Product(name: "Fixture 3", unit: "unit 3", price: "price 3"),
                Product(name: "Fixture 4", unit: "unit 4", price: "price 4"),
                Product(name: "Fixture 5", unit: "unit 5", price: "price 5")]
    }

    static var fixture: Product {
        return Product(name: "Fixture 1", unit: "unit 1", price: "price 1")
    }
}
