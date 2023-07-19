//
//  ToDoApp.swift
//  ToDo
//
//  Created by Nnéna Okrs on 18/07/2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

// Rien compris - Adding initialization code to your application
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        //connect the app to the FireStore Emulator
        let useEmulator = UserDefaults.standard.bool(forKey: "useEmulator") // la possibilité de switch entre emulator suite et le firebase project jcomprends quedal mais ça a l'air cool
        if useEmulator {
            let settings = Firestore.firestore().settings
            settings.host = "localhost:8080"
            settings.isSSLEnabled = false
            Firestore.firestore().settings = settings
            
            // connect the app to the Authentification Emulator
            Auth.auth().useEmulator(withHost: "localhost", port: 9099) // en fait je comprends pas le mot emulator
        }
        return true
    }
}

// je devrais avoir un gros pavé qui s'affiche pour dire qu'il est content mais y a walou

@main
struct ToDoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate // entry point
    var body: some Scene {
        WindowGroup {
            NavigationView {
                RemindersListView()
                    .navigationTitle("Reminders")
            }
        }
    }
}
