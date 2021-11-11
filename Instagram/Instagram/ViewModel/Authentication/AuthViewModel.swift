//
//  AuthViewModel.swift.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/11/04.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login() {
        print("Login")
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("성공!")
        }
    }
    
    func singout() {
        print("singout")
    }
    
    func fetchUser() {
        print("fetchUser")
    }
    
}
