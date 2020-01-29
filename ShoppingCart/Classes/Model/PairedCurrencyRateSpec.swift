import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class CurrencyRateSpec: QuickSpec {
    override func spec() {
        describe("PairedCurrencyRate") { 
            var sut: PairedCurrencyRate!

            describe("decoding from json") {
                beforeEach {
                    let data = jsonString.data(using: .utf8)!

                    sut = try? JSONDecoder().decode(PairedCurrencyRate.self, from: data)
                }

                it("should have correct value") {
                    expect(sut.value) == 1.170228
                }
            }
        }
    }
}

private let jsonString = """
                         {
                             "rates":{
                                 "EURUSD":{
                                     "rate":1.170228,
                                     "timestamp":1532428704963}
                                 },
                             "code":200
                         }
                         """