//
//  MockIoCContainer.swift
//  ContactsTests
//
//  Created by Paul Allies on 2022/04/18.
//
@testable import Contacts
import Foundation
import Swinject

func buildMockContainer() -> Container{
    
    let container = Container()
//    
//    container.register(CreateContactUseCaseProtocol.self) { _  in
//        return MockGetProductsUseCase()
    
    return container
}
