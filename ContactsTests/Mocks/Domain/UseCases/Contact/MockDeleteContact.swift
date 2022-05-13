@testable import Contacts

import Foundation

final class MockDeleteContact: DeleteContactUseCaseProtocol{
    var executeResult: Result<Bool, ContactError>  = .success(true)
    var executeGotCalledWith: (UUID) = (UUID())
        
    func execute(_ id: UUID) async -> Result<Bool, ContactError> {
        executeGotCalledWith = (id)
        return executeResult
    }
}
