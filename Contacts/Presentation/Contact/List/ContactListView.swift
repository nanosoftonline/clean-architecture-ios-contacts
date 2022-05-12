
import SwiftUI

struct ContactListView: View {
    @StateObject var vm = ContactListViewModel(
        getAllContacts: Resolver.shared.resolve(GetAllContactsUseCaseProtocol.self),
        deleteContact: Resolver.shared.resolve(DeleteContactUseCaseProtocol.self)
    )
    
    fileprivate func onLoad() {
        Task{
            await vm.getContacts()
        }
    }
    
    fileprivate func renderListItem(_ contact: ContactResponseModel) -> some View {
        NavigationLink(destination: ContactEditView(contactId: contact.id)){
            HStack{
                VStack(alignment:.leading){
                    Text("\(contact.name)")
                        .font(.body)
                        .foregroundColor(.black)
                    
                }
            }
        }
        
    }
    
    fileprivate func onDelete(at offsets: IndexSet){
        let item = vm.contacts[offsets.min()!]
        Task{
            await vm.deleteContact(item.id)
            await vm.getContacts()
        }
    }
    
    fileprivate func renderList() -> some View{
        List{
            ForEach(vm.contacts, id:\.self){contact in
                renderListItem(contact)
            }.onDelete(perform: onDelete)
        }
        .onAppear(perform: onLoad )
        .navigationTitle("Contacts")
        .toolbar(content: { AddButton(destination: AnyView(ContactCreateView())) })
    }
    
    var body: some View {
        NavigationView{
            renderList()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
