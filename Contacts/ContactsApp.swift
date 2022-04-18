//
//  ContactsApp.swift
//  Contacts
//
//  Created by Paul Allies on 2022/04/18.
//

import SwiftUI

@main
struct ContactsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
