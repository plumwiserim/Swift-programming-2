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
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("에러: 사용자 로그인에 실패하였습니다. \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
                
    }
    
    func register(withEmail email: String,
                  password: String,
                  image: UIImage?,
                  fullname: String,
                  username: String) {
                
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("에러: 사용자 등록에 실패하였습니다. \(error.localizedDescription)")
                    return
                }
                guard let user = result?.user else { return }
                print("성공: 사용자 등록에 성공하였습니다.")
                
                let data = ["email": email,
                            "usename": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid
                ]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("성공: 사용자 정보를 저장하였습니다.")
                    self.userSession = user
                }
            }
        }
    }
    
    func singout() {
        self.userSession = nil
        try? Auth.auth().signOut()
        print("성공: 로그아웃에 성공하였습니다.")
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
            print("성공: 현재 사용자 정보를 가져왔습니다.")
        }
    }
}
