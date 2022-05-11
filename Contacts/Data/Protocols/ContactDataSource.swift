import Foundation
protocol ContactDataSource{
    func getAll()    -> Result<[ContactResponseModel], ContactError>
    func getOne(id: UUID)    -> Result<ContactResponseModel?, ContactError>
    func create(_ contactRequestModel: ContactRequestModel)  -> Result<Bool, ContactError>
    func update(id: UUID, data: ContactRequestModel)   -> Result<Bool, ContactError>
    func delete(id: UUID)   -> Result<Bool, ContactError>
}
