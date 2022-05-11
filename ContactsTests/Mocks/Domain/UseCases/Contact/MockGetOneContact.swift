
@testable import Contacts

import Foundation

final class MockGetContact: GetContactUseCaseProtocol{
   
    var executeResult: Result<ContactResponseModel?, ContactError>  = .success(ContactResponseModel(id: UUID(), name: "Paul"))
    var executeGotCalled  = false;
    var executeGotCalledWith: (UUID)!
    
    func execute(_ id: UUID) async -> Result<ContactResponseModel?, ContactError> {
        executeGotCalled = true
        return executeResult
    }
}
