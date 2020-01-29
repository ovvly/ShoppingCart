import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class ProductViewModelSpec: QuickSpec {
    override func spec() {
        describe("ProductViewModel") { 
            var sut: DefaultProductViewModel!

            describe("amount") {
                describe("init") {
                    beforeEach {
                        sut = DefaultProductViewModel(product: Product.fixture, amount: 42)
                    }

                    it("should return correct amount") {
                        expect(sut.amountString) == "42"
                    }
                }

                describe("amount increase") {
                    beforeEach {
                        sut = DefaultProductViewModel(product: Product.fixture, amount: 0)

                        sut.amountIncreased()
                    }

                    it("should call amount changed with increased amount") {
                        expect(sut.amountString) == "1"
                    }
                }

                describe("amount decrease") {
                    context("amount is greater than 0") {
                        beforeEach {
                            sut = DefaultProductViewModel(product: Product.fixture, amount: 1)

                            sut.amountDecreased()
                        }

                        it("should call amount changed with decreased amount") {
                            expect(sut.amountString) == "0"
                        }
                    }

                    context("amount is equal 0") {
                        beforeEach {
                            sut = DefaultProductViewModel(product: Product.fixture, amount: 0)

                            sut.amountDecreased()
                        }

                        it("should not change amount") {
                            expect(sut.amountString) == "0"
                        }
                    }
                }

                describe("total price") {
                    beforeEach {
                        sut = DefaultProductViewModel(product: Product.fixture, amount: 2)
                    }
                    
                    it("should have correct total price") {
                        expect(sut.totalPrice) == 84.0
                    }
                }
            }
        }
    }
}