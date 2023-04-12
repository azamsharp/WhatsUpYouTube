//
//  WhatsUpApp.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/13/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct WhatsUpApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var model = Model()
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $appState.routes) {
                ZStack {
                    if Auth.auth().currentUser != nil {
                        MainView()
                    } else {
                        LoginView()
                    }
                }.navigationDestination(for: Route.self) { route in
                    switch route {
                        case .main:
                            MainView()
                        case .login:
                            LoginView()
                        case .signUp:
                            SignUpView()
                    }
                }
                
            }
            .environmentObject(model)
            .environmentObject(appState)
        }
    }
}
