import Foundation

protocol DeleteContactUseCaseProtocol {
    func execute(_ id: UUID) async -> Result<Bool, ContactError>
}

