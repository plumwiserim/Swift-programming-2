//
//  ImageUploader.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/11/11.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("에러: 프로필 이미지 업로드에 실패하였습니다. \(error.localizedDescription)")
                return
            }
            print("성공: 프로필 이미지 업로드에 성공하였습니다.")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
