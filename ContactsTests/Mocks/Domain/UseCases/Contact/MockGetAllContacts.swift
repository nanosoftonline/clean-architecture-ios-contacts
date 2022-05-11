@testable import Contacts

import Foundation

final class MockGetAllContacts: GetAllContactsUseCaseProtocol{
    var executeResult: Result<[ContactResponseModel], Error>  = .success([])
    var executeGotCalled  = false;
    
    func execute() async -> Result<[ContactResponseModel], Error> {
        executeGotCalled = true
        return executeResult
    }
}
