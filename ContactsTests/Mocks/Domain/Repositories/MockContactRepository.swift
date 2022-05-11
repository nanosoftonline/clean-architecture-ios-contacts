@testable import Contacts

import Foundation

final class MockContactRepository: ContactRepository{
    
    var getContactsResult: Result<[ContactResponseModel], Error>  = .success([])
    var getContactsGotCalled  = false
    
    var getContactResult: Result<ContactResponseModel?, Error>  = .success(ContactResponseModel(id: UUID(), name: "Some Name"))
    var getContactGotCalledWith  = (UUID())
    
    var createContactResult: Result<Void, Error>  = .success(())
    var createContactGotCalledWith  = (ContactRequestModel(name: ""))
    
    var updateContactResult: Result<Void, Error>  = .success(())
    var updateContactGotCalledWith  = (UUID(), ContactRequestModel(name: ""))
    
    var deleteContactResult: Result<Void, Error>  = .success(())
    var deleteContactGotCalledWith  = (UUID())
        
        
    func getContacts() async -> Result<[ContactResponseModel], Error> {
        getContactsGotCalled = true
        return getContactsResult;
    }
    
    func getContact(id: UUID) async -> Result<ContactResponseModel?, Error> {
        getContactGotCalledWith = (id)
        return getContactResult;
    }
    
    func deleteContact(id: UUID) async -> Result<Void, Error> {
        deleteContactGotCalledWith = (id)
        return deleteContactResult;
    }
    
    func updateContact(id: UUID, data: ContactRequestModel) async -> Result<Void, Error> {
        updateContactGotCalledWith = (id, data)
        return updateContactResult;
    }
    
    func createContact(data: ContactRequestModel) async -> Result<Void, Error> {
        createContactGotCalledWith = data
        return createContactResult;
    }
    
}
