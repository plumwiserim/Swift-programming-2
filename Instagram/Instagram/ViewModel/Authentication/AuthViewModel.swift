//
//  AuthViewModel.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/11/04.
//

import SwiftUI
import Firebase

class AuthViewModel {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register(withEmail email: String, password: String) {
        print(email)
        print(password)
        print("Register")
    }
    
    func signout() {
        print("signout")
    }
    
    func fetchUser() {
        print("")
    }
}
