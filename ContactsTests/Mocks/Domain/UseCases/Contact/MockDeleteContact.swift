@testable import Contacts

import Foundation

final class MockDeleteContact: DeleteContactUseCaseProtocol{
    var executeResult: Result<Bool, ContactError>  = .success(true)
    var executeGotCalled  = false;
    var executeGotCalledWith: (UUID)!
    
    func execute(_ id: UUID) async -> Result<Bool, ContactError> {
        executeGotCalled = true
        executeGotCalledWith = (id)
        return executeResult
    }
}
