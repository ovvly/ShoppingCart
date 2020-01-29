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
    private let currenciesService: CurrenciesService

    init(currenciesService: CurrenciesService) {
        self.currenciesService = currenciesService
    }

    func currency(for index: Int) -> Currency {
        return currencies[index]
    }

    func fetchCurrencies(completion: @escaping (Result<Void, NetworkError>) -> ()) {
        //Fixme: add error handling
        currenciesService.fetchCurrencies { [weak self] result in
            switch result {
                case .failure:
                    completion(Result.failure(NetworkError.genericError))
                case .success(let currencies):
                    let supportedCurrencies = currencies.supportedPairs.filterCurrenciesNotConvertibleToUSD()
                    self?.currencies = supportedCurrencies
                    completion(Result.success(()))
            }
        }
    }

    func fetchRate(for index: Int, completion: (Currency, CurrencyRate) -> ()) {
        let currency = "EUR"
        let rate: Decimal = 1.1
        completion(currency, rate)
    }
}

private extension Array where Element == String {
    func filterCurrenciesNotConvertibleToUSD() -> [String] {
        return filter { $0.hasPrefix("USD") }
            .map { String($0.suffix(3)) }
    }
}
