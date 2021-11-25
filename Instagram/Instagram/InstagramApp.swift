//
//  InstagramApp.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/09/30.
//

import SwiftUI
import Firebase

@main
struct InstagramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
