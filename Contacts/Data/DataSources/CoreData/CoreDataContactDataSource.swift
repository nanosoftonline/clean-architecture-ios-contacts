import Foundation

class CoreDataContactDataSource : ContactDataSource {

    
    let dbWrapper: CoreDataWrapperProtocol
    
    init(dbWrapper: CoreDataWrapperProtocol){
        self.dbWrapper = dbWrapper
    }
    
    private func mapToContactResponse(contactEntity: ContactEntity) -> ContactResponseModel{
        return ContactResponseModel(id: contactEntity.id!, name: contactEntity.name!)
    }
    
    private func _getAll() throws -> [ContactEntity] {
        let result: [ContactEntity] = try dbWrapper.getData(entityName: "ContactEntity") as! [ContactEntity]
        return result
    }
    
    private func _getOne(id: UUID) throws -> ContactEntity {
        let result: [ContactEntity] = try dbWrapper.getData(entityName: "ContactEntity", predicate: NSPredicate(format: "id = %@", id.uuidString)) as! [ContactEntity]
        return result[0]
    }
    
    func getOne(id: UUID)  -> Result<ContactResponseModel?, ContactError> {
        do{
            let data = try _getOne(id: id)
            return .success(ContactResponseModel(id: data.id ?? UUID(), name: data.name ?? ""))
        }catch{
            return .failure(.Get)
        }
    }
    
    func getAll() -> Result<[ContactResponseModel], ContactError> {
        do{
            let data = try _getAll()
            
            return .success(data.map({ contactEntity in
                mapToContactResponse(contactEntity: contactEntity)
            }))
        }catch{
            return .failure(.Get)
        }
    }
    
//    func update(id: UUID, data: ContactRequestModel)  -> Result<Bool, ContactError> {
//        do{
//            let data = try _getOne(id: id)
//            data.name = data.name
//            try dbWrapper.save()
//            return .success(true)
//        }catch{
//            return .failure(.Update)
//        }
//    }
//
//    func delete(id: UUID)  -> Result<Bool, ContactError> {
//        do{
//            let data = try _getOne(id: id)
//            data.prepareForDeletion()
//            try dbWrapper.save()
//            return .success(true)
//        }catch{
//            return .failure(.Delete)
//        }
//    }
//
//
//
//    func getAll()   -> Result<[ContactResponseModel], ContactError> {
//        do
//        {
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactEntity")
//            let result = try dbWrapper.fetch(fetchRequest) as! [NSManagedObject]
//            var data: [ContactResponseModel] = []
//            for record in result {
//                data.append(ContactResponseModel(id: record.value(forKey: "id") as! UUID, name: record.value(forKey: "name") as! String))
//
//            }
//            return .success(data)
//        }catch{
//            return .failure(.Get)
//        }
//    }
//
    func create(_ contactRequestModel: ContactRequestModel)  -> Result<Bool, ContactError> {
        do{

            let newContact = ContactEntity(context: dbWrapper.getContext())
            newContact.id = UUID();
            newContact.name = contactRequestModel.name;
            try dbWrapper.save()
            return .success(true)
        }catch{
            return .failure(.Create)
        }

    }
    
    
}

