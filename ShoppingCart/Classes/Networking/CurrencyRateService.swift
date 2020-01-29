import Foundation

protocol CurrencyRateService {
    func fetchRate(for pair: String, completion: @escaping (Result<CurrencyRate, Error>) -> ())
}

final class CurrencyRateNetworkService: CurrencyRateService {
    private let session: NetworkSession
    private let jsonDecoder: JSONDecoding

    init(session: NetworkSession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main),
         jsonDecoder: JSONDecoding = JSONDecoder()) {
        self.session = session
        self.jsonDecoder = jsonDecoder
    }

    func fetchRate(for pair: String, completion: @escaping (Result<CurrencyRate, Error>) -> ()) {
        let url = buildUrl(for: pair)
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            //TODO: make better error handling
            guard let data = data, let pairedRate = try? self?.jsonDecoder.decode(PairedCurrencyRate.self, from: data) else {
                let error = error ?? NetworkError.genericError
                completion(.failure(error))
                return
            }
            completion(.success(pairedRate.value))
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
