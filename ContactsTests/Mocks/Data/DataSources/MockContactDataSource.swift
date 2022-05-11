@testable import Contacts

import Foundation

final class MockContactDataSource: ContactDataSourceProtocol{
    var getAllResult: Result<[ContactResponseModel], ContactError>  = .success([])
    var getAllGotCalled  = false
    func getAll() async -> Result<[ContactResponseModel], ContactError> {
        getAllGotCalled = true
        return getAllResult
    }
    
    var getOneResult: Result<ContactResponseModel?, ContactError>  = .success(ContactResponseModel())
    var getOneGotCalledWith  = (UUID())
    func getOne(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        getOneGotCalledWith = (id)
        return getOneResult
    }
    
    
    var createResult: Result<Bool, ContactError>  = .success(false)
    var createGotCalledWith  = (ContactRequestModel())
    func create(_ contactRequestModel: ContactRequestModel) async -> Result<Bool, ContactError> {
        createGotCalledWith = contactRequestModel
        return createResult
    }
    
    
    var updateResult: Result<Bool, ContactError>  = .success(false)
    var updateGotCalledWith  = (UUID(), ContactRequestModel())
    func update(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        updateGotCalledWith = (id, data)
        return updateResult
    }
    
    
    var deleteResult: Result<Bool, ContactError>  = .success(false)
    var deleteGotCalledWith  = (UUID())
    func delete(_ id: UUID) async -> Result<Bool, ContactError> {
        deleteGotCalledWith = (id)
    return deleteResult
    }
    
    

    
}
