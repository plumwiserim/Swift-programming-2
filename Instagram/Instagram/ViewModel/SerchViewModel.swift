//
//  SerchViewModel.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/11/18.
//

import Foundation
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self)})        
            print("성공: 사용자 정보를 가져왔습니다.\(self.users)")
        }
    }
    
}
