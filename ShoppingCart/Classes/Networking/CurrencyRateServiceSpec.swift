import Foundation
import Quick
import Nimble

@testable import ShoppingCart

class CurrencyRateServiceSpec: QuickSpec {
    override func spec() {
        describe("CurrencyRateNetworkService") { 
            var sut: CurrencyRateNetworkService!
            var networkSessionSpy: NetworkSessionSpy!
            var jsonDecoderSpy: JsonDecoderSpy!

            beforeEach {
                networkSessionSpy = NetworkSessionSpy()
                jsonDecoderSpy = JsonDecoderSpy()

                sut = CurrencyRateNetworkService(session: networkSessionSpy, jsonDecoder: jsonDecoderSpy)
            }

            describe("fetch rate") {
                describe("request") {
                    beforeEach {
                        jsonDecoderSpy.pairedRateToReturn = PairedCurrencyRate(value: 42.0)

                        sut.fetchRate(for: "fixturePair", completion: { _ in})
                    }

                    it("should call correct URL") {
                        expect(networkSessionSpy.capturedURL) == URL(string: "https://www.freeforexapi.com/api/live?pairs=fixturePair")
                    }
                }

                context("when returned data is correct") {
                    var capturedCurrencyRate: CurrencyRate!

                    beforeEach {
                        jsonDecoderSpy.pairedRateToReturn = PairedCurrencyRate(value: 42.0)
                        
                        sut.fetchRate(for: "fixturePair" ) { result in
                            switch result {
                                case .success(let currencyRate):
                                    capturedCurrencyRate = currencyRate
                                case .failure:
                                    return
                            }
                        }
                    }
                    
                    it("should call completion with success result") {
                        expect(capturedCurrencyRate) == 42.0
                    }
                }

                context("when returned data is incorrect") {
                    var requestFailed: Bool!

                    beforeEach {
                        jsonDecoderSpy.shouldComplete = false
                        
                        sut.fetchRate(for: "fixturePair" ) { result in
                            switch result {
                                case .success:
                                    return
                                case .failure:
                                    requestFailed = true
                            }
                        }
                    }

                    it("should call completion with success result") {
                        expect(requestFailed) == true
                    }
                }
            }
        }
    }
}

enum JsonDecoderSpyError: Error {
    case failedToComplete
    case noRateToReturn
}