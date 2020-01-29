import Foundation

protocol CurrenciesService {
    func fetchCurrencies(completion: @escaping (Result<CurrencyPairs, Error>) -> ())
}

final class CurrenciesNetworkService: CurrenciesService {
    private let session: URLSession

    init() {
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
    }

    func fetchCurrencies(completion: @escaping (Result<CurrencyPairs, Error>) -> ()) {
        let url = buildUrl()
        let task = session.dataTask(with: url) { data, response, error in
            //TODO: make better error handling
            guard let data = data, let pairs = try? JSONDecoder().decode(CurrencyPairs.self, from: data) else {
                let error = error ?? NetworkError.genericError
                completion(.failure(error))
                return
            }
            completion(.success(pairs))
        }
        task.resume()
    }

    private func buildUrl() -> URL {
        //TODO: make better url building, this is temporary
        guard let url = URL(string: "https://www.freeforexapi.com/api/live") else {
            fatalError("Failed to build correct url")
        }
        return url
    }
}
