import Foundation

typealias Currency = String
typealias CurrencyRate = Decimal

enum NetworkError: Error {
    case genericError
}

final class CurrencySelectionViewModel {

    var numberOfCurrencies: Int {
        return currencies.count
    }

    private var currencies = [Currency]()

    func currency(for index: Int) -> Currency {
        return currencies[index]
    }

    func fetchCurrencies(completion: (Result<Void, NetworkError>) -> ()) {
        //download currencies
        //assign to currencies

        currencies = ["USD", "EUR", "PLN"]
        //Fixme: add error handling
        completion(Result.success(()))
    }
    func fetchRate(for index: Int, completion: (Currency, CurrencyRate) -> ()) {
        let currency = "EUR"
        let rate: Decimal = 1.1
        completion(currency, rate)
    }
}