import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class ProductCellViewModelSpec: QuickSpec {
    override func spec() {
        describe("ProductCellViewModel") { 
            var sut: DefaultProductCellViewModel!
            var capturedAmountString: String!

            beforeEach {
                capturedAmountString = ""
            }

            describe("initial amount") {
                beforeEach {
                    sut = DefaultProductCellViewModel(amount: 42)
                }
                
                it("should return correct amount") {
                    expect(sut.initialAmount) == "42"
                }
            }
            
            describe("amount increase") {
                beforeEach {
                    sut = DefaultProductCellViewModel(amount: 0)
                    sut.amountChanged = { amountString in
                        capturedAmountString = amountString
                    }

                    sut.amountIncreased()
                }

                it("should call amount changed with increased amount") {
                    expect(capturedAmountString) == "1" 
                }
            }

            describe("amount decrease") {
                context("amount is greater than 0") {
                    beforeEach {
                        sut = DefaultProductCellViewModel(amount: 1)
                        sut.amountChanged = { amountString in
                            capturedAmountString = amountString
                        }

                        sut.amountDecreased()
                    }

                    it("should call amount changed with decreased amount") {
                        expect(capturedAmountString) == "0"
                    }
                }

                context("amount is equal 0") {
                    beforeEach {
                        sut = DefaultProductCellViewModel(amount: 0)
                        sut.amountChanged = { amountString in
                            capturedAmountString = amountString
                        }

                        sut.amountDecreased()
                    }

                    it("should not call amount changed") {
                        expect(capturedAmountString) == ""
                    }
                }
            }

        }
    }
}