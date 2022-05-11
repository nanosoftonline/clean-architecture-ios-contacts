import Foundation
protocol UpdateContactUseCaseProtocol {
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Void, Error>
}
