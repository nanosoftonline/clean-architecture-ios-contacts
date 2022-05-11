@testable import Contacts

import Foundation

final class MockGetAllContacts: GetAllContactsUseCaseProtocol{
    var executeResult: Result<[ContactResponseModel], ContactError>  = .success([])
    var executeGotCalled  = false;
    
    func execute() async -> Result<[ContactResponseModel], ContactError> {
        executeGotCalled = true
        return executeResult
    }
}
