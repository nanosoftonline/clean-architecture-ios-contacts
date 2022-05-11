import Foundation

@testable import Contacts

import Foundation

final class MockUpdateContact: UpdateContactUseCaseProtocol{
    var executeResult: Result<Bool, ContactError>  = .success(false)
    var executeGotCalled  = false;
    var executeGotCalledWith  = (UUID(), ContactRequestModel(name: ""))
    
    
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Bool, ContactError> {
        executeGotCalled = true
        executeGotCalledWith = (id, data)
        return executeResult
    }
}
