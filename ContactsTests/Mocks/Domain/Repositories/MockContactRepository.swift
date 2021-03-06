@testable import Contacts

import Foundation

final class MockContactRepository: ContactRepositoryProtocol{
    
    var getContactsResult: Result<[ContactResponseModel], ContactError>  = .success([])
    var getContactsGotCalled  = false
    func getContacts() async -> Result<[ContactResponseModel], ContactError> {
        getContactsGotCalled = true
        return getContactsResult;
    }
    
    var getContactResult: Result<ContactResponseModel?, ContactError>  = .success(ContactResponseModel(id: UUID(), name: "Some Name"))
    var getContactGotCalledWith  = (UUID())
    func getContact(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        getContactGotCalledWith = (id)
        return getContactResult;
    }
    
    var deleteContactResult: Result<Bool, ContactError>  = .success(false)
    var deleteContactGotCalledWith  = (UUID())
    func deleteContact(_ id: UUID) async -> Result<Bool, ContactError> {
        deleteContactGotCalledWith = (id)
        return deleteContactResult;
    }
    
    var updateContactResult: Result<Bool, ContactError>  = .success(false)
    var updateContactGotCalledWith  = (UUID(), ContactRequestModel(name: ""))
    func updateContact(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        updateContactGotCalledWith = (id, data)
        return updateContactResult;
    }
    
    var createContactResult: Result<Bool, ContactError>  = .success(false)
    var createContactGotCalledWith  = (ContactRequestModel(name: ""))
    func createContact(_ data: ContactRequestModel) async -> Result<Bool, ContactError> {
        createContactGotCalledWith = data
        return createContactResult;
    }
    
}
