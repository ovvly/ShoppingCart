import Foundation
import Quick
import Nimble
import SnapshotTesting

@testable import ShoppingCart

class ProductListViewControllerSpec: QuickSpec {
    override func spec() {
        describe("ProductListViewController") {
            var viewModelStub: ProductListViewModelStub!
            var sut: ProductListViewController!

            beforeEach {
                viewModelStub = ProductListViewModelStub()
                sut = ProductListViewController(viewModel: viewModelStub)
                _ = sut.view
            }
            
            it("should show list of products") {
                assertSnapshot(matching: sut, as: .image(on: .iPhone8))
            }
        }
    }
}

private final class ProductListViewModelStub: ProductListViewModel {
    private(set) var productsCount: Int = 4
    func viewModel(for index: Int) -> ProductViewModel {
        let productViewModelSpy =  ProductViewModelSpy()
        productViewModelSpy.name = "Fixture \(index)" 
        productViewModelSpy.unit = "unit \(index)" 
        productViewModelSpy.price = "price \(index)"
        return productViewModelSpy
    }
}
