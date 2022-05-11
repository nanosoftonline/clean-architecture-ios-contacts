import Foundation

protocol ContactRepository{
    
    func getContacts() async -> Result<[ContactResponseModel], Error>
    
    func getContact(id: UUID) async -> Result<ContactResponseModel?, Error>
    
    func deleteContact(id: UUID) async -> Result<Void, Error>
    
    func updateContact(id: UUID, data: ContactRequestModel) async -> Result<Void, Error>
    
    func createContact(data: ContactRequestModel) async -> Result<Void, Error>
}
