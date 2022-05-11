import Foundation

class ContactListViewModel: ObservableObject{
    private let getAllContacstUseCase: GetAllContactsUseCaseProtocol
    
    init(getAllContacts: GetAllContactsUseCaseProtocol){
        self.getAllContacstUseCase = getAllContacts
    }
    
    @Published var errorMessage = ""
    @Published var contacts : [ContactResponseModel] = []
    
    
    func getContacts() async{
        
        let result = await self.getAllContacstUseCase.execute()
        switch result{
        case .success(let contacts):
            self.contacts = contacts
        case .failure(_):
            self.errorMessage = "Error Fetching Contacts"
                        
        }
    }
}
