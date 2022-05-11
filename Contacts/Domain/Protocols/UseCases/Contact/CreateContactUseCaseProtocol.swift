
import Foundation

protocol CreateContactUseCaseProtocol {
    func execute(_ contact: ContactRequestModel) async -> Result<Bool, ContactError>
}
