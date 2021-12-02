# 할일
- Follow/UnFollow 완성
- 취업(및 창업) 관련 당부사항
- Next Step?

# 리뷰(Follow/UnFollow 완성)
- View(완성) => SwiftUI를 사용해서 완성 => MVVM 모델 
- Back-end 설정 => Firebase로 진행 => 기본적인 기능(사용자관리, 단순한 CRUD, 파일저장)
- ViewModel 설계 및 개발 => 
    - 1) Model => viewVodel을 설계(구현) => View에 반영되어야 함
    - 2) view의 변경사항 => viewModel을 설계(구현) => Model에 반영되어야 함

# 취업 관련 몇가지 당부사항
- 1.  포트폴리오를 거창하게 만들지 마세요. => “아주 잘 작동하도록 만드세요”
    - AI를 사용해서 번호판 인식을 실시간으로 하는 안드로이드 앱(85%)
        - 프로그램이 제대로 작동 안 함
    - 게시판(대댓글 게시판) => 엄청 작동을 잘 함
        - 대댓글 달리면 알림, 애니메이션, 글쓰기(markdown, latex, 일반글쓰기, 받아쓰기)
- 2. 코딩테스트는 파이썬으로 보고, 왜 직무는 백엔드/스프링으로 하셨나요?
    - 코딩테스트만 연습해서, 개발 못하는거 아냐?
    - 1. 포트폴리오가 매우 잘 작동해야 함
- 3. 해커톤, 00경진대회 => github 제출(주소) => commit이 이상하면 애초에 적지마세요.
    - github 주소를 => 1) 협업을 어떻게 했는지 확인 Issue에, PR에 리뷰 PR 60개
    - 2) 리뷰를 보고(친구들이랑 코드를 어떻게 논의하는지)

- 파이썬으로 머신러닝 00 모델을 만들자 => 데이터 엔지니어 직군(개발자 직군)

- iOS 대부분 iOS 개발로 => 5년차 => “타부서 이동”
    - 당근마켓 => iOS => 5년 { iOS, 커뮤니티 비지니스 } => 타부서 / 다른회사 (백엔드 +)

- 개발자 첫 시작은 스타트업 보다는 중견기업 
    - 스타트업 : 내가 다 해야 됨 (재미있음) => 알려주는 사람이 없음
    - 중견(네이버, 강남언니…) => 해야될 일이 정해져있다. 손들면 시켜준다. 

- 보안 => 인프라, 개발 및 설계(보안)

# Next Step
- 1) [2~3학년] 포항공대 애플 아카데미(신청 => 트라이)
- 2) [3~4학년] 주제를 하나 잡아서 앱을 하나 만드세요(친구들)
    - Backend 1명
    - UI 1명
    - iOS/ Android 각 1명 => 4명 => 안구해지면(X)
    - 앱 => 반드시 출시하세요!
- 3) [4학년] 코테준비하세요.
- 4) 창업하시는 분들
    - 창업은 꼭 성공할 필요는 없어요
    - 반드시 “ 서비스는 런칭”
        - 1. 기획서는 잘 쓰세요(기획자로 갑니다)
        - 2. 마케팅 지표(분석을 하셔서 가지고 계셔야 => 기획으로 갑니다)
        - 3. 서비스 런칭 시 사용했던 코드는 반드시 보관 
———————————————————————————————————————

import Firebase

class ProfileViewModel: ObservableObject {
	
	var user: User

	init(user: User) {
		self.user = user
	}

	func follow() {
		// 내가 누군지 알아야 함 => guard uid!!
		// Firebase의 특정 API를 사용 => 관계형DB를 사용 못함 => NoSQL을 관계형으로 만들어야 함
			// firebase에 follow
			// 내가 A를 팔로우
			// A가 B를 팔로우 한다는 사실을 Firebase에 적어둬야 함
		guard let uid = user.id else { return }
		// 저장!! => Firebase storage
		UserService.follow(uid: uid) { _ in
			print(“팔로우 성공”)
		} 	}

	func unfollow() {
		guard let uid = user.id else { return }
		UserService.unfollow(uid: uid) { _ in
			self.user.isFollowed = false
		}
	}

	func checkIfUserIsFollowed() {
		guard !user.isCurrentUser else { return }
		guard let uid = user.id else { return }
		UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
			self.
		}
	}
}

———————————————————————————————————————

import SwiftUI

struct ProfileView: View {
	
	let user: User
	@ObservedObject var viewModel: ProfileViewModel

	init(user: User) {
		self.user = user
		self.viewModel = ProfileViewModel(user: user) 
	}

	var body: some View {
		ScrollView {
			VStack(spacing: 32) {
				ProfileHeaderView(user: user)
				PostGridView() 
			}
		}.padding(.top)
	}
}

———————————————————————————————————————

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
	
	@Observed
	
	Text() {

———————————————————————————————————————

import SwiftUI

struct ProfileActionButtonView: View {
	
	@ObservedObject var viewModel: ProfileViewModel
	var isFollowed: Bool { return viewModel.user.isFollowed ?? false }

	var body: some View {
		if viewModel.user.isCurrentUser {
			Button(action: {}, label: {
				Text(“Edit Profile”)
					.font(.system(size: 15, weight: .semibold))
					.frame(width: 360, height: 32) 
					.foregroundColor(.blue)
	
———————————————————————————————————————

import Foundation
import Firebase

struct UserService {
	// follow => id
	static func follow(uid: String, completion: ((Error?) -> Void)?) {
		guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
	Firestore.firestore().collection(“following”).document(currentUid).collection(“user-following”)
			.document(uid).setData([:]) { _ in 
				Firestore.firestore().collection(“followers”).document(uid).collection(“user-followers”)
				.document(currentUid).setData([:], completion: completion)	
			}
		
		// 
		//
		// 
		// 
	}
}

———————————————————————————————————————

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
	@DocumentID var id: String?
	let username: String
	let email: String
	let fullname: String
	let profileImageUrl: String

	var isFollowed: Bool? = false
	var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id
}
