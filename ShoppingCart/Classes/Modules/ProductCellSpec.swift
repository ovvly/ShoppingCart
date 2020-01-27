import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class ProductCellSpec: QuickSpec {
    override func spec() {
        describe("ProductCell") {
            var viewModelSpy: ProductCellViewModelSpy!
            var sut: ProductCell!

            beforeEach {
                viewModelSpy = ProductCellViewModelSpy()
                sut = ProductCell(style: .default, reuseIdentifier: nil)

                sut.bind(to: viewModelSpy)
            }

            context("when tapping increase button") {
                beforeEach {
                    sut.increaseButton.simulateTap()
                }
                
                it("should inform view model") {
                    expect(viewModelSpy.increaseCalled) == 1
                }
            }

            context("when tapping increase button twice") {
                beforeEach {
                    sut.increaseButton.simulateTap()
                    sut.increaseButton.simulateTap()
                }

                it("should inform view model twice") {
                    expect(viewModelSpy.increaseCalled) == 2
                }
            }

            context("when tapping decrease button") {
                beforeEach {
                    sut.decreaseButton.simulateTap()
                }

                it("should inform view model") {
                    expect(viewModelSpy.decreaseCalled) == 1
                }
            }

            context("when tapping decrease button twice") {
                beforeEach {
                    sut.decreaseButton.simulateTap()
                    sut.decreaseButton.simulateTap()
                }

                it("should inform view model twice") {
                    expect(viewModelSpy.decreaseCalled) == 2
                }
            }
        }
    }
}

private final class ProductCellViewModelSpy: ProductCellViewModel {
    var initialAmount: String = ""
    var amountChanged: ((String) -> ())?
    var increaseCalled = 0
    var decreaseCalled = 0

    func amountIncreased() {
        increaseCalled += 1
    }
    func amountDecreased() {
        decreaseCalled += 1
    }
}