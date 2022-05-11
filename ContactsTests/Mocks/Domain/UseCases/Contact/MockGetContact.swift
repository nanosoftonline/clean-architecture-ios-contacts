
@testable import Contacts

import Foundation

final class MockGetContact: GetContactUseCaseProtocol{
   
    var executeResult: Result<ContactResponseModel?, Error>  = .success(ContactResponseModel(id: UUID(), name: "Paul"))
    var executeGotCalled  = false;
    var executeGotCalledWith: (UUID)!
    
    func execute(id: UUID) async -> Result<ContactResponseModel?, Error> {
        executeGotCalled = true
        return executeResult
    }
}
