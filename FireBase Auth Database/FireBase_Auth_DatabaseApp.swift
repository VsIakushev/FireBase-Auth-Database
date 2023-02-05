//
//  FireBase_Auth_DatabaseApp.swift
//  FireBase Auth Database
//
//  Created by Vitaliy Iakushev on 04.02.2023.
//

import SwiftUI
import Firebase

@main
struct FireBase_Auth_DatabaseApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
//            ContentView()
        }
    }
}
