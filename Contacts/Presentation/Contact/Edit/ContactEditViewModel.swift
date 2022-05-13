import Foundation


class ContactEditViewModel: ObservableObject{
    private let updateContact: UpdateContactUseCaseProtocol
    private let getContact: GetContactUseCaseProtocol
    
    init(
        updateContact: UpdateContactUseCaseProtocol,
        getContact: GetContactUseCaseProtocol
    ){
        self.updateContact = updateContact
        self.getContact = getContact
    }
    
    @Published var errorMessage = ""
    @Published var originalContact = ContactResponseModel()
    @Published var name = ""
    @Published var showAlert = false
    @Published var isLoading: Bool = false
    
    
    func getContact(_ id:UUID) async{
        self.isLoading = true
        let result = await self.getContact.execute(id)
        switch result{
        case .success(let data):
            self.errorMessage = ""
            self.name = data!.name
            self.originalContact = data!
            self.isLoading = false
        case .failure(_):
            self.isLoading = false
            self.errorMessage = "Error Fetching Contact"
        }
    }
    
    
    var canSave: Bool {
        return (originalContact.name != self.name && !self.name.isEmpty)
    }
    
    func updateContact(_ id: UUID) async{
        let data = ContactRequestModel(name: self.name)
        let result = await self.updateContact.execute(id: id, data: data)
        switch result{
        case .success(_):
            self.errorMessage = ""
        case .failure(_):
            self.errorMessage = "Error Updating Contact"
        }
        
    }
    
    
    
}
