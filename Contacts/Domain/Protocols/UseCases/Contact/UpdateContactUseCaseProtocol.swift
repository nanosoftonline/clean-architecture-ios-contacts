import Foundation

protocol UpdateContactUseCaseProtocol {
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError>
}
