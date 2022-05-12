import SwiftUI

struct ContactEditView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var vm = ContactEditViewModel(
        updateContact: Resolver.shared.resolve(UpdateContactUseCaseProtocol.self),
        getContact: Resolver.shared.resolve(GetContactUseCaseProtocol.self)
    )
    
    var contactId: UUID?
    
    fileprivate func onLoad() {
        Task{
            if(contactId != nil){
                await vm.getContact(contactId!)
            }
        }
    }
    
    fileprivate func onSave(){
        Task{
           await vm.updateContact(contactId!)
           goBack()
        }
    }
    
    func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
    

    
    fileprivate func buildForm() -> some View {
        Form{
            TextInputView(label: "Contact Name", value: $vm.name)

        }
        .confirmationDialog("Are you sure you want to discard your changes?", isPresented: $vm.showAlert, titleVisibility: .visible) {
            
            Button("Discard Changes", role: .destructive, action: {goBack()})
            
            Button("Keep Editing", role:.cancel, action:{})
        }
    }
    
    var body: some View{
        buildForm()
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonView(previousScreenTitle: "Contacts", canGoBack: !vm.canSave, goBack: goBack, showAlert: $vm.showAlert))
            .navigationTitle("Edit Contact")
            .toolbar(content: { SaveButtonView(onSave: onSave, isDisabled: !vm.canSave) })
            .onAppear(perform: onLoad )
    }
}

struct ContactEditView_Previews: PreviewProvider {
    static var previews: some View {
        ContactEditView()
    }
}
