//
//  SimpListApp.swift
//  SimpList
//
//  Created by kazunari.ueeda on 2020/10/03.
//

import SwiftUI

@main
struct SimpListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
