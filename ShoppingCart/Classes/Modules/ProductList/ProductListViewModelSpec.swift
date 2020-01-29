import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class ProductListViewModelSpec: QuickSpec {
    override func spec() {
        describe("ProductListViewModel") { 
            var sut: DefaultProductListViewModel!

            beforeEach {
                sut = DefaultProductListViewModel(products: Product.fixtures)
            }

            //Fixme: this is fast way of doing this test but to do it properly we should have also view model builder injected in init and make view model stubs in test using it
            describe("total price") {
                beforeEach {
                    let product1ViewModel = sut.viewModel(for: 0)
                    product1ViewModel.amountIncreased()
                    product1ViewModel.amountIncreased()

                    let product2ViewModel = sut.viewModel(for: 1)
                    product2ViewModel.amountIncreased()
                    product2ViewModel.amountIncreased()
                    product2ViewModel.amountIncreased()
                }
                
                it("should have correct amount") {
                    expect(sut.totalPrice) == 32.0
                }
            }
        }
    }
}