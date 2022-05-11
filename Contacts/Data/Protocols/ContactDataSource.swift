import Foundation
protocol ContactDataSource{
    func getAll()   throws -> Result<[ContactResponseModel], ContactError>
    func getOne(id: UUID)   throws -> Result<ContactResponseModel?, ContactError>
//    func create(data: ContactRequestModel)  throws -> Result<Bool, ContactError>
//    func update(id: UUID, data: ContactRequestModel)  throws -> Result<Bool, ContactError>
//    func delete(id: UUID)  throws -> Result<Bool, ContactError>
}
