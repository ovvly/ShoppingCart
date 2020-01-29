import Foundation

typealias Currency = String

final class CurrencySelectionViewModel {
    var numberOfCurrencies: Int {
        return currencies.count
    }

    private var currencies = [Currency]()
    private let currenciesService: CurrenciesService
    private let rateService: CurrencyRateService

    init(currenciesService: CurrenciesService, rateService: CurrencyRateService) {
        self.currenciesService = currenciesService
        self.rateService = rateService
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

    func fetchRate(for index: Int, completion: @escaping (Result<(Currency, CurrencyRate), NetworkError>) -> ()) {
        let currency = currencies[index]

        rateService.fetchRate(for: currency) { result in
            switch result {
                case .failure:
                    completion(.failure(NetworkError.genericError))
                case .success(let rate):
                    completion(.success((currency, rate)))
            }
        }
    }
}

private extension Array where Element == String {
    func filterCurrenciesNotConvertibleToUSD() -> [String] {
        return filter { $0.hasPrefix("USD") }
            .map { String($0.suffix(3)) }
    }
}
