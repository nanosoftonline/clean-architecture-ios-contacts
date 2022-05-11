import Foundation
class GetOneContact : GetContactUseCaseProtocol{

    
    private let contactRepo: ContactRepositoryProtocol
    
    init(contactRepo: ContactRepositoryProtocol){
        self.contactRepo = contactRepo
    }
    
    func execute(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        return await contactRepo.getContact(id)
    }

    
}
