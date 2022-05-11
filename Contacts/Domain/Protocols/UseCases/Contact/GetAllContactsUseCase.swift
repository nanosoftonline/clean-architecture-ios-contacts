
import Foundation

protocol GetAllContactsUseCaseProtocol{
    func execute() async -> Result<[ContactResponseModel], Error>
}
