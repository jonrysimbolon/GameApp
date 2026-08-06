import Alamofire
import Combine

public final class AlamofireNetworkProvider: NetworkProvider {

    private let session: Session
    private let config: APIConfig

    public init(
        config: APIConfig,
        session: Session = .default
    ) {
        self.config = config
        self.session = session
    }

    public func request<T: Decodable & Sendable>(
        endpoint: Endpoint,
        response: T.Type
    ) -> AnyPublisher<T, Error>{

        Future<T, Error> { promise in

            let url = self.config.baseURL + endpoint.path

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
