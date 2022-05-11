import Foundation

protocol DeleteContactUseCaseProtocol {
    func execute(id: UUID) async -> Result<Void, Error>
}

