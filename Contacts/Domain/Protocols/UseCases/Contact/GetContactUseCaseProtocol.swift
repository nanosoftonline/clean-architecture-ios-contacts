import Foundation
protocol GetContactUseCaseProtocol {
    func execute(_ id:UUID) async -> Result<ContactResponseModel?, ContactError>
}
