import Foundation

protocol CurrencyRateService {
    func fetchRate(for pair: String, completion: @escaping (Result<CurrencyRate, Error>) -> ())
}

final class CurrencyRateNetworkService: CurrencyRateService {
    private let session: URLSession

    init() {
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
    }

    func fetchRate(for pair: String, completion: @escaping (Result<CurrencyRate, Error>) -> ()) {
        let url = buildUrl(for: pair)
        let task = session.dataTask(with: url) { data, response, error in
            //TODO: make better error handling
            guard let data = data, let pairedRate = try? JSONDecoder().decode(PairedCurrencyRate.self, from: data) else {
                let error = error ?? NetworkError.genericError
                completion(.failure(error))
                return
            }
            guard let rate = pairedRate.value else {
                completion(.failure(NetworkError.genericError))
                return
            }
            completion(.success(rate))
        }
        task.resume()
    }

    private func buildUrl(for pair: String) -> URL {
        //TODO: make better url building, this is temporary
        guard let url = URL(string: "https://www.freeforexapi.com/api/live?pairs=\(pair)") else {
            fatalError("Failed to build correct url")
        }
        return url
    }
}
