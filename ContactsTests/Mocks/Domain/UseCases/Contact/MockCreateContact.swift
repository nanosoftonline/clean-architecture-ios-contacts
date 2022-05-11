

@testable import Contacts

import Foundation

final class MockCreateContact: CreateContactUseCaseProtocol{
    var executeResult: Result<Void, Error>  = .success(())
    var executeGotCalled  = false;
    var executeGotCalledWith: ContactRequestModel?
    
    func execute(contact: ContactRequestModel) async -> Result<Void, Error> {
        executeGotCalled = true
        executeGotCalledWith = contact
        return executeResult
    }
}
