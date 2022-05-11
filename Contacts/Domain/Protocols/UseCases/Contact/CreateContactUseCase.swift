
import Foundation

protocol CreateContactUseCaseProtocol {
    func execute(contact: ContactRequestModel) async -> Result<Void, Error>
}
