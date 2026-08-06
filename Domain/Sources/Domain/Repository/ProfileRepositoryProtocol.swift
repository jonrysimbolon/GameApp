import Foundation

public protocol ProfileRepositoryProtocol {

    func loadProfile() -> Profile

    func saveProfile(_ profile: Profile)
}
