import Alamofire

enum Endpoint {

    case games(page: Int)
    case gameDetail(id: Int)
    case search(query: String)

    var path: String {
        switch self {

        case .games:
            return "/games"

        case .gameDetail(let id):
            return "/games/\(id)"

        case .search:
            return "/games"
        }
    }

    var parameters: Parameters {

        switch self {

        case .games(let page):

            return [
                "key": APIConfig.apiKey,
                "page": page,
                "page_size": 20
            ]

        case .gameDetail:

            return [
                "key": APIConfig.apiKey
            ]

        case .search(let query):

            return [
                "key": APIConfig.apiKey,
                "search": query,
                "page_size": 20
            ]
        }
    }
}
