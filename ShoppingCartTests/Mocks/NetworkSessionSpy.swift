import Foundation
@testable import ShoppingCart

final class NetworkSessionSpy: NetworkSession {
    var capturedURL: URL? = nil
    var dataToReturn: Data = Data()

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> ()) -> URLSessionDataTask {
        capturedURL = url
        completionHandler(dataToReturn, nil, nil)
        return URLSessionDataTask()
    }
}
