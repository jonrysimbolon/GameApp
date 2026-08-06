import Alamofire

public enum Endpoint {

    case games(page: Int)
    case gameDetail(id: Int)
    case search(query: String)

    public var path: String {
        switch self {

        case .games:
            return "/games"

        case .gameDetail(let id):
            return "/games/\(id)"

        case .search:
            return "/games"
        }
    }

    public var parameters: Parameters {

        switch self {

        case .games(let page):
            return [
                "page": page,
                "page_size": 20
            ]

        case .gameDetail:
            return [:]

        case .search(let query):
            return [
                "search": query,
                "page_size": 20
            ]
        }
    }
}
