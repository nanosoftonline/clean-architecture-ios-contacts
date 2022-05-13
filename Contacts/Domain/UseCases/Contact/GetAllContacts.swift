import Foundation
class GetAllContacts : GetAllContactsUseCaseProtocol{
    
    private let contactRepo: ContactRepositoryProtocol
    
    init(contactRepo: ContactRepositoryProtocol){
        self.contactRepo = contactRepo
    }
    
    func execute() async -> Result<[ContactResponseModel], ContactError> {
        return await contactRepo.getContacts()
    }
     
}
