
import Swinject

func buildContainer() -> Container {
    let container = Container()
    
//    let dbWrapper = CoreDataWrapper()
    
    container.register(CoreDataWrapperProtocol.self){ _ in
        return CoreDataWrapper()
    }.inObjectScope(.container)

    container.register(ContactDataSourceProtocol.self){ _ in
        return CoreDataContactDataSource(dbWrapper: container.resolve(CoreDataWrapperProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(ContactRepositoryProtocol.self){ _ in
        return ContactRepository(contactDataSource : container.resolve(ContactDataSourceProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(GetAllContactsUseCaseProtocol.self){ _ in
        return GetAllContacts(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(UpdateContactUseCaseProtocol.self){ _ in
        return UpdateContact(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(DeleteContactUseCaseProtocol.self){ _ in
        return DeleteContact(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(GetContactUseCaseProtocol.self){ _ in
        return GetOneContact(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(CreateContactUseCaseProtocol.self){ _ in
        return CreateContact(contactRepo: container.resolve(ContactRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    return container
    
}
