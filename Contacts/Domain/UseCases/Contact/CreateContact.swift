import Foundation
class CreateContact : CreateContactUseCaseProtocol{
    
    
    private let contactRepo: ContactRepositoryProtocol
    
    init(contactRepo: ContactRepositoryProtocol){
        self.contactRepo = contactRepo
    }
    
    func execute(_ contact: ContactRequestModel) async -> Result<Bool, ContactError> {
        return await self.contactRepo.createContact(contact)
    }
}
