@testable import Contacts

import Foundation

final class MockDeleteContact: DeleteContactUseCaseProtocol{
    var executeResult: Result<Void, Error>  = .success(())
    var executeGotCalled  = false;
    var executeGotCalledWith: (UUID)!
    
    func execute(id: UUID) async -> Result<Void, Error> {
        executeGotCalled = true
        executeGotCalledWith = (id)
        return executeResult
    }
}
