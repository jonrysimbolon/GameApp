import Combine

public protocol NetworkProvider {

    func request<T: Decodable & Sendable>(
        endpoint: Endpoint,
        response: T.Type
    ) -> AnyPublisher<T, Error>
}
