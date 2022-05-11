import Foundation


class ContactEditViewModel: ObservableObject{
    private let updateContactUseCase: UpdateContactUseCaseProtocol
    private let deleteContactUseCase: DeleteContactUseCaseProtocol
    
    init(updateContact: UpdateContactUseCaseProtocol, deleteContact: DeleteContactUseCaseProtocol){
        self.updateContactUseCase = updateContact
        self.deleteContactUseCase = deleteContact
    }
    
    @Published var errorMessage = ""
    @Published var name = ""
    
    
    func deleteContact(id: UUID) async{
        let result = await self.deleteContactUseCase.execute(id)
        switch result{
        case .success(_):
            self.errorMessage = ""
        case .failure(_):
            self.errorMessage = "Error Deleting Contact"
        }
    }
    
    func onNameChange(name: String){
        self.name = name
    }
    
    func updateContact(id: UUID) async{
        let data = ContactRequestModel(name: self.name)
        let result = await self.updateContactUseCase.execute(id: id, data: data)
        switch result{
        case .success(_):
            self.errorMessage = ""
        case .failure(_):
            self.errorMessage = "Error Updating Contact"
        }
        
    }
    
    
    
}
