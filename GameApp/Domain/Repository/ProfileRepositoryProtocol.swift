internal import Foundation

protocol ProfileRepositoryProtocol {

    func loadProfile() -> Profile

    func saveProfile(_ profile: Profile)
}
