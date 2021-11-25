# Search and Profile
- DB에 Query를 날려서 결과를 받아오는 것에 관심있어요.
    - 1) 데이터가 있어야 함
    - 2) 출력부분에 ‘오류’가 없어야 함
- CRUD
    - 1) Read를 먼저함 => SELECT * FROM ALL
    - 2) Dummy를 강제로 밀어넣음 => [“Hello”]

    - 1) ‘C’ 데이터를 생성하는 것 먼저 만들고
    - 2) ‘R’ 특정 데이터를 출력하는 부분을 만듬
		=> 그 데이터를 구성하는 요소를 어떻게 구현하는지!
    - 3) ‘R’ 전체 데이터를 순회하는 부분을 만듬
		=> 앞선 2에서 만든 Type을 활용해서 순회 가능한 자료구조로 변환
		=> iOS -> Array, Kotlin -> List, Python -> List
		=> 순회가능(이터레이터!)
    - 4) 특정 데이터의 경우 수정을 진행해야 함
		=> 이미지?! -> [*.png, *.jpg, *.svg, *.pdf, *.gif]
		=> 이미지를 출력하는 방법은 어떻게 되나요?
		 -> [구글서버] => “다운로드” => [내 아이폰] => iOS SDK를 이용해서 => [출력]
		 -> 2) 나만 이렇진 않다!, 나만 이걸 하기 싫은건 아니다. 남들도 마찬가지다!
			이미지 캐시 라이브러리 Kingfisher

# 그거 그냥 가지고 오면 되지 않느냐? => SELECT * 

#

## Review
- 1) Firebase에 있는 모든 데이터를 초기화
- 2) 데이터를 3개 정도를 입력
    - 단, 중복 되게 입력하지 마세요. 

import Foundation

struct User {
	let 
	let 
	let 
	let 

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
	@DocumentId var id: String?
	let username: String
	let email: String
	let fullname: String
	let profileImageUrl: String
}

func fetchUser() {
	guard let uid = userSession?.uid else { return }
	Firestore = 

import Foundation

class SearchViewModel: ObservableObject {

}

import SwiftUI

struct UserListView: View {
	
	@ObservedObject var viewModel = SearchViewModel()

	var body: some View {
		ScrollView {
			LazyVStack {
				ForEach (viewModel.users) { _ in
					NavigationLink(destination: ProfileView(), label: {
						UserCell().padding(.leading)
					})
				}
			}
		}
	}
}

import Foundation
import Firebase

class SearchViewModel: ObservableObject {
	@Published var users = [User]()
	
	init() {
		fetchUser()
	}

	func fetchUser() {
		Firestore.firestore().collection(“users”).getDocuments { snapshot, _ in 
			guard let documents = snapshot?.documents else { return }
			self.users = documents.compactMap({ try? $0.data(as: User.self)})
			print(self.users)
		}
	}
}

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let usename: String
    let email: String
    let fullname: String
    let profileImageUrl: String
}

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
            print(“성공:”self.users)
        }
    }
    
}
