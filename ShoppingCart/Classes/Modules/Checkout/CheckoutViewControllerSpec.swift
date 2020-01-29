import Foundation
import Quick
import Nimble
import SnapshotTesting

@testable import ShoppingCart

class CheckoutViewControllerSpec: QuickSpec {
    override func spec() {
        describe("CheckoutViewController") {
            var viewModelStub: CheckoutViewModelStub!
            var sut: CheckoutViewController!

            beforeEach {
                viewModelStub = CheckoutViewModelStub()
                sut = CheckoutViewController(viewModel: viewModelStub)
                _ = sut.view
            }

            it("should show list of products") {
                assertSnapshot(matching: sut, as: .image(on: .iPhone8))
            }
        }
    }
}

private class CheckoutViewModelStub: CheckoutViewModel {
    func update(currency: String, rate: Decimal) { }

    let priceString = "$ 42,42"
}