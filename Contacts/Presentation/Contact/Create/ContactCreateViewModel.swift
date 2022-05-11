import Foundation


class ContactCreateViewModel: ObservableObject{
   private let createContactUseCase: CreateContactUseCaseProtocol
    
    init(createContact: CreateContactUseCaseProtocol){
        self.createContactUseCase = createContact
    }
    
    @Published var errorMessage = ""
    @Published var name = ""
    
    
    func onNameChange(name: String){
        self.name = name
    }

    
    func createContact() async{
        
        let result = await self.createContactUseCase.execute(ContactRequestModel(name: self.name))
        switch result{
        case .success(_):
            self.errorMessage = ""
        case .failure(_):
            self.errorMessage = "Error Creating Contact"
        }

    }
            
}
