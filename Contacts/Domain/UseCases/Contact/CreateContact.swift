import Foundation
class CreateContact : CreateContactUseCaseProtocol{
    
    
    private let contactRepo: ContactRepository
    
    init(contactRepo: ContactRepository?){
        self.contactRepo = contactRepo!
    }
    
    func execute(contact: ContactRequestModel) async -> Result<Void, Error> {
        return await self.contactRepo.createContact(data: contact)
    }
}
