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

            describe("prepare for reuse") {
                beforeEach {
                    sut.increaseAction = { }
                    sut.decreaseAction = { }

                    sut.prepareForReuse()
                }

                it("should remove increase action") {
                    expect(sut.increaseAction).to(beNil())
                }

                it("should remove decrease action") {
                    expect(sut.decreaseAction).to(beNil())
                }
            }

            describe("buttons") {
                var increaseActionCalls: Int!
                var decreaseActionCalls: Int!

                beforeEach {
                    increaseActionCalls = 0
                    decreaseActionCalls = 0

                    sut.increaseAction = {
                        increaseActionCalls += 1
                    }

                    sut.decreaseAction = {
                        decreaseActionCalls += 1
                    }
                }

                context("when increase button is tapped") {
                    beforeEach {
                        sut.increaseButton.simulateTap()
                    }

                    it("should call increase action") {
                        expect(increaseActionCalls) == 1
                    }
                }

                context("when decrease button is tapped") {
                    beforeEach {
                        sut.decreaseButton.simulateTap()
                    }

                    it("should call decrease action") {
                        expect(decreaseActionCalls) == 1
                    }
                }
            }
        }
    }
}