//
//  User.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/11/18.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let usename: String
    let email: String
    let fullname: String
    let profileImageUrl: String
}


