

import Foundation
import Swinject

//@propertyWrapper
//struct Inject<I> {
//    let wrappedValue: I
//    init() {
//        //Resolve the interface to an implementation.
//        self.wrappedValue = Resolver.shared.resolve(I.self)
//    }
//}
//
//class Resolver {
//    static let shared = Resolver()
//    
//    //get the IOC container
//    private var container = buildContainer()
//    
//    func resolve<T>(_ type: T.Type) -> T {
//        container.resolve(T.self)!
//    }
//    //this is used for tests to set mock container
//    func setDependencyContainer(_ container: Container) {
//            self.container = container
//        }
//}
