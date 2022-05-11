
import Swinject

func buildContainer() -> Container {
    let container = Container()
    
//    container.register(CreateContactUseCaseProtocol.self){ resolver in
//        return CreateContact(contactRepo: resolver.resolve(ContactRepository.self))
//        
//    }
//    
//    container.register(ContactNewViewModel.self){resolver in
//        return ContactNewViewModel(createContact: resolver.resolve(CreateContactUseCaseProtocol.self)!)
//    }

    
    return container
    
}
