import Foundation

class ContactRepository : ContactRepositoryProtocol{
    
    private let contactDataSource: ContactDataSourceProtocol
    
    init(contactDataSource: ContactDataSourceProtocol){
        self.contactDataSource = contactDataSource
    }
    
    func getContacts() async -> Result<[ContactResponseModel], ContactError> {
        return await contactDataSource.getAll()
    }
    
    func getContact(_ id: UUID) async  -> Result<ContactResponseModel?, ContactError> {
        return await  contactDataSource.getOne(id)
    }
    
    func deleteContact(_ id: UUID) async -> Result<Bool, ContactError> {
        return await contactDataSource.delete(id)
    }
    
    func updateContact(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        return await contactDataSource.update(id: id, data: data)
    }
    
    func createContact(_ contactRequestModel: ContactRequestModel) async  -> Result<Bool, ContactError> {
        return await contactDataSource.create(contactRequestModel)
    }
}
