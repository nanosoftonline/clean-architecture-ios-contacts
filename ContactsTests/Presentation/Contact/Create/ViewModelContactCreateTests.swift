
@testable import Contacts
import XCTest



class ViewModelContactCreateTests: XCTestCase {
    var vm: ContactCreateViewModel!
    var mockCreateContact : MockCreateContact!
    
    override func setUp() {
        mockCreateContact = MockCreateContact()
        vm = .init(createContact: mockCreateContact)
        
    }
    
    func test_createContact_execute_should_be_called() async{
        mockCreateContact.executeResult = .success(true)
        vm.onNameChange(name: "Paul")
        await vm.createContact()
        XCTAssertTrue(mockCreateContact.executeGotCalled)
        XCTAssertEqual(mockCreateContact.executeGotCalledWith, ContactRequestModel(name: "Paul"))
    }
    
    
    func test_should_set_error_when_createContact_fails() async{
        mockCreateContact.executeResult = .failure(ContactError.Create)
        vm.onNameChange(name: "Paul")
        await vm.createContact()
        XCTAssertEqual(vm.errorMessage, "Error Creating Contact")
    }
    
}
