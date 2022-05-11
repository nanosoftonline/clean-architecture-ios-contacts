import Foundation

struct ContactResponseModel: Identifiable, Equatable, Hashable {
    let id: UUID
    var name: String
    
    init(){
    id = UUID()
    name = ""
    }
    
    init(id: UUID, name: String){
        self.id = id
        self.name = name
    }
    
}

struct ContactRequestModel: Equatable {
    var name: String
    
    init(){
    name = ""
    }
    
    init(name: String){
        self.name = name
    }
    
}

