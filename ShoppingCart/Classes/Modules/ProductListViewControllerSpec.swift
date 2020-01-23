import Foundation
import Quick
import Nimble
import SnapshotTesting

@testable import ShoppingCart

class ProductListViewControllerSpec: QuickSpec {
    override func spec() {
        describe("ProductListViewController") {
            var sut: ProductListViewController!
        
            beforeEach {
                sut = ProductListViewController(products: ["Product 1", "Product 2", "Product 3", "Product 4"])
                
                _ = sut.view
            }
            
            it("should show list of products") {
                assertSnapshot(matching: sut, as: .image(on: .iPhone8))
            }
        }
    }
}
