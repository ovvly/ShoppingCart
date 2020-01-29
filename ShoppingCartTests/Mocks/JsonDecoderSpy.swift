import Foundation
@testable import ShoppingCart

final class JsonDecoderSpy: JSONDecoding {
    var pairedRateToReturn: PairedCurrencyRate?
    var shouldComplete: Bool = true

    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T: Decodable {
        guard shouldComplete else {
            throw JsonDecoderSpyError.failedToComplete
        }
        return pairedRateToReturn as! T
    }
}
