import Foundation

class CoreDataContactDataSource : ContactDataSourceProtocol {
    
    
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
    
    func getOne(_ id: UUID)  -> Result<ContactResponseModel?, ContactError> {
        do{
            let data = try _getOne(id: id)
            return .success(ContactResponseModel(id: data.id!, name: data.name!))
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
    
    func create(_ contactRequestModel: ContactRequestModel)  -> Result<Bool, ContactError> {
        do{
            
            let newContact = ContactEntity(context: dbWrapper.getContext())
            newContact.id = UUID();
            newContact.name = contactRequestModel.name;
            try dbWrapper.saveEntity(entity: newContact)
            return .success(true)
        }catch{
            return .failure(.Create)
        }
        
    }
    
    func delete(_ id: UUID) -> Result<Bool, ContactError> {
        do{
            let data = try _getOne(id: id)
            try dbWrapper.deleteEntity(entity: data)
            return .success(true)
        }catch{
            return .failure(.Delete)
        }
    }
    
    func update(id: UUID, data: ContactRequestModel) -> Result<Bool, ContactError> {
        do{
            let oldData = try _getOne(id: id)
            oldData.name = data.name
            try dbWrapper.saveEntity(entity: oldData)
            return .success(true)
        }catch{
            return .failure(.Update)
        }
    }
    
    
}

