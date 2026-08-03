enum ViewState: Equatable {
    case idle
    case loading
    case loaded
    case searching
    case empty
    case error(String)
}
