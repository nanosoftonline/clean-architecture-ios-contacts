
import Foundation
class UpdateContact : UpdateContactUseCaseProtocol{

    private let contactRepo: ContactRepositoryProtocol
    
    init(contactRepo: ContactRepositoryProtocol){
        self.contactRepo = contactRepo
    }

    func execute(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        return await self.contactRepo.updateContact(id: id, data: data)
    }
  
}
