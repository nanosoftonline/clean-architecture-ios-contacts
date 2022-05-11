

@testable import Contacts

import Foundation

final class MockCreateContact: CreateContactUseCaseProtocol{
    var executeResult: Result<Bool, ContactError>  = .success(true)
    var executeGotCalled  = false;
    var executeGotCalledWith: ContactRequestModel?
    
    func execute(_ contact: ContactRequestModel) async -> Result<Bool, ContactError> {
        executeGotCalled = true
        executeGotCalledWith = contact
        return executeResult
    }
}
