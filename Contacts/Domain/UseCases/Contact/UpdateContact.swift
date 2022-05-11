
import Foundation
class UpdateContact : UpdateContactUseCaseProtocol{

    private let contactRepo: ContactRepository
    
    init(contactRepo: ContactRepository?){
        self.contactRepo = contactRepo!
    }

    func execute(id: UUID, data: ContactRequestModel) async -> Result<Void, Error> {
        return await self.contactRepo.updateContact(id: id, data: data)
    }
  
}
