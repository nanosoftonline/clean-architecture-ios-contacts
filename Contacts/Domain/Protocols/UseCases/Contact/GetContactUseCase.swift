import Foundation
protocol GetContactUseCaseProtocol {
    func execute(id:UUID) async -> Result<ContactResponseModel?, Error>
}
