### Clean Architecture: An iOS Project

By employing clean architecture, you can design applications with very low coupling and independent of technical implementation details. That way, the application becomes easy to maintain and flexible to change. Clean architecture allows us to create architectural boundaries between dependencies which allows components to be intrinsically testable.

This repo holds the code to illustrate how we will attempt to build an iOS application using clean architecture with TDD. The app will be used to manage contacts.

We are going to structure our application in the following way:

#### System Structure
We structure the application in the following way to show intent by file / folder structure

```
-- Contacts
    │── Presentation
    │   └── Contact
    │       ├── Create
    │       │   ├── ContactCreateViewModel.swift
    │       │   └── ContactCreateView.swift
    │       ├── Edit
    │       │   ├── ContactEditViewModel.swift
    │       │   └── ContactEditView.swift
    │       └── List
    │           ├── ContactListViewModel.swift
    │           └── ContactListView.swift
    ├── Domain
    │   ├── Protocols
    │   │   ├── UseCases
    │   │   │   └── Contact
    │   │   │       ├── CreateContactUseCase.swift
    │   │   │       ├── UpdateContactUseCase.swift
    │   │   │       ├── DeleteContactUseCase.swift
    │   │   │       ├── GetContactUseCase.swift
    │   │   │       └── GetAllContactsUseCase.swift
    │   │   └── Repositories
    │   │       └── ContactRepository.swift
    │   ├── Models
    │   │   └── Contact.swift
    │   ├── UseCases
    │   │   └── Contact
    │   │       ├── CreateContact.swift
    │   │       ├── UpdateContact.swift
    │   │       ├── DeleteContact.swift
    │   │       ├── GetAllContacts.swift
    │   │       └── GetContact.swift
    │   └── Repositories
    │       └── ContactRepositoryImpl.swift
    └── Data
        ├── Protocols
        │   └── ContactDataSourceProtocol.swift
        └── DataSources
            └── CoreData
            ├── Entities
            │   └── Contact.xcdatamodeld
            └── CoreDataContactDataSource.swift
-- ContactTests
    │── Mocks
    │   ├── Domain
    │   │   ├── Repositories
    │   │   │    └── MockContactRepository.swift
    │   │   └── UseCases
    │   │       ├── MockCreateContact.swift
    │   │       ├── MockUpdateContact.swift
    │   │       ├── MockDeleteContact.swift
    │   │       ├── MockGetAllContacts.swift
    │   │       └── MockGetOneContact.swift  
    │   └── Data
    │       ├── DataSources
    │       │   └── MockContactDataSource.swift
    │       └── CoreData
    │           └── Wrappers
    │               └── MockCoreDataWrapper.swift
    │── Presentation
    │   └── Contact
    │       ├── Create
    │       │   └── ViewModelContactCreateTests.swift
    │       ├── Edit
    │       │   └── ViewModelContactEditTests.swift
    │       └── List
    │           └── ViewModelContactListTests.swift
    ├── Domain
    │   ├── UseCases
    │   │   └── Contact
    │   │       ├── UseCaseContactCreateTests.swift
    │   │       ├── UseCaseContactUpdateTests.swift
    │   │       ├── UseCaseContactDeleteTests.swift
    │   │       ├── UseCaseContactsGetAllTests.swift
    │   │       └── UseCaseContactGetOneTest.swift
    │   └── Repositories
    │       └── ContactRepositoryTests.swift
    └── Data
        └── DataSources
            └── CoreDataContactDataSourceTests.swift

```

We have our application and test bundle. We mirror our test bundle on the application bundle.

