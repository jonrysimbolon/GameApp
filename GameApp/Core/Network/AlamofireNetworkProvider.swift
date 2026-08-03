import Alamofire
import Combine

final class AlamofireNetworkProvider: NetworkProvider {

    private let session: Session

    init(session: Session = .default) {
        self.session = session
    }

    func request<T: Decodable>(
        endpoint: Endpoint,
        response: T.Type
    ) -> AnyPublisher<T, Error> {

        Future<T, Error> { promise in

            let url = APIConfig.baseURL + endpoint.path

            self.session
                .request(
                    url,
                    method: .get,
                    parameters: endpoint.parameters
                )
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { response in

                    switch response.result {

                    case .success(let value):
                        promise(.success(value))

                    case .failure(let error):

                        if let underlying = error.underlyingError {

                            promise(.failure(APIError.network(underlying)))

                        } else {

                            promise(.failure(APIError.network(error)))
                        }
                    }
                }

        }
        .eraseToAnyPublisher()
    }
}
