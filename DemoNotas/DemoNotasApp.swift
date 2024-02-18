//
//  DemoNotasApp.swift
//  DemoNotas
//
//  Created by Aguid Ramirez Sanchez on 18/02/24.
//

import SwiftUI

@main
struct DemoNotasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
