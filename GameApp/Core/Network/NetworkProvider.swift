import Combine

protocol NetworkProvider {

    func request<T: Decodable>(
        endpoint: Endpoint,
        response: T.Type
    ) -> AnyPublisher<T, Error>
}
