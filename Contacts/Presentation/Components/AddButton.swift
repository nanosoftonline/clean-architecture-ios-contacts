import SwiftUI

struct AddButton: View {
    var destination: AnyView
        
    var body: some View {
        Button(action:{}){
            NavigationLink(destination: destination){
                Image(systemName: "plus")
                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
