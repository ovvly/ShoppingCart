import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class ProductCellSpec: QuickSpec {
    override func spec() {
        describe("ProductCell") { 
            var sut: ProductCell!

            beforeEach {
                sut = ProductCell(style: .default, reuseIdentifier: nil)
            }

            describe("init") {
                it("should have amount equal 0") {
                    expect(sut.amountLabel.text) == "0"
                }
            }
            
            context("when tapping increase button") {
                beforeEach {
                    sut.increaseButton.simulateTap()
                }
                
                it("should increase amount") {
                    expect(sut.amountLabel.text) == "1"
                }
            }

            context("when tapping increase button twice") {
                beforeEach {
                    sut.increaseButton.simulateTap()
                    sut.increaseButton.simulateTap()
                }

                it("should increase amount twice") {
                    expect(sut.amountLabel.text) == "2"
                }
            }

            context("when tapping decrease button") {
                context("when amount is above 0") {
                    beforeEach {
                        sut.amount = 1

                        sut.decreaseButton.simulateTap()
                    }

                    it("should decrease amount") {
                        expect(sut.amountLabel.text) == "0"
                    }
                }

                context("when amount is 0") {
                    beforeEach {
                        sut.amount = 0

                        sut.decreaseButton.simulateTap()
                    }

                    it("should not decrease amount") {
                        expect(sut.amountLabel.text) == "0"
                    }
                }
            }

            context("when tapping decrease button twice") {
                context("when amount is 1") {
                    beforeEach {
                        sut.amount = 1

                        sut.decreaseButton.simulateTap()
                        sut.decreaseButton.simulateTap()
                    }

                    it("should decrease amount once") {
                        expect(sut.amountLabel.text) == "0"
                    }
                }

                context("when amount is above 1") {
                    beforeEach {
                        sut.amount = 2

                        sut.decreaseButton.simulateTap()
                        sut.decreaseButton.simulateTap()
                    }

                    it("should decrease amount twice") {
                        expect(sut.amountLabel.text) == "0"
                    }
                }
            }
        }
    }
}