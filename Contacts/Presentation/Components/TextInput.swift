import SwiftUI

struct TextInputView: View {
    
    var label: String
    @Binding var value: String
    
    
    var body: some View {
        Section(header: Text(label)){
            TextField(label,text: $value)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
    }
}
