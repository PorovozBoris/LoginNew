//
//  NewLoginApp.swift
//  NewLogin
//
//  Created by Тима Тихонов on 30.03.22.
//

import SwiftUI
import Firebase

@main
struct NewLoginApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
