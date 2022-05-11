import Foundation

@testable import Contacts

import Foundation

final class MockUpdateContact: UpdateContactUseCaseProtocol{
    var executeResult: Result<Void, Error>  = .success(())
    var executeGotCalled  = false;
    var executeGotCalledWith  = (UUID(), ContactRequestModel(name: ""))
    
    
    func execute(id: UUID, data: ContactRequestModel) async -> Result<Void, Error> {
        executeGotCalled = true
        executeGotCalledWith = (id, data)
        return executeResult
    }
}
