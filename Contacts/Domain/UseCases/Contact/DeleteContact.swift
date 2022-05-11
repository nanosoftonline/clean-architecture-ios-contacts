
import Foundation
class DeleteContact : DeleteContactUseCaseProtocol{
    private let contactRepo: ContactRepositoryProtocol
    
    init(contactRepo: ContactRepositoryProtocol){
        self.contactRepo = contactRepo
    }

    func execute(_ id: UUID) async -> Result<Bool, ContactError> {
        return await self.contactRepo.deleteContact(id)
    }
  
}
