# Review1

1. (예제가 없는 분들) ’iOS-Instagram-class.zip’ 파일을 다운로드 후 프로젝트 진행
=> 에러가 발생하면 ‘File > Packages > Reset … ’
2. Firebase 홈페이지 고고!
=> 등록된 Dummy 데이터 삭제
3. Firebase의 프로젝트 설정
=> GoogleService-info.plist 를 다운로드
=> 1번에서 실행 중인 폴더에 복사
4. 빌드 후 실행 확인(계정 등록)


# Review2

1. 왜 로그인은 계속 진행되어 있는가?
=> 계정을 삭제했는데?, 앱을 지웠는데?, 도대체 무슨 일인가?
=> 로그아웃을 안 했기 때문이죠!
=> 세션은 기기에 저장됨
=> 사용자가 기기정보를 깨끗하게 삭제하지 않으면
=> 계속 남아있어요

2. Logout
=> self.userSession을 깔끔하게 지워야 됨
=> 서버에 현재 세션을 종료시켜야 됨

3. Error vs Try-Cache
=> ‘Error’는 말 그대로 “에러”
=> ’Try-Cache’ 

4. 
# 오늘의 하이라이트 !
- 사용자 등록
- 사용자 정보를 저장
    - Firestore는 데이터베이스(like MongoDB)
    - Storage는 파일 저장소(like

import UIKit
import ImageUploader {

// uploadImage(이미지파일, callback)
// -> 이미지를 무조건 jpg로 변경합니다. jpg가 안되면 종료
// -> 이미지이름이 “홍길동”, “야호!”, 난수로 변경합니다. 
// -> Storage에 저장합니다. 단, 프로필 이미지 폴더에 저장하도록 설정합니다. 
// -> Storage에 파일을 전송합니다. 
// -> 성공할 수도 있고 !
// -> 실패할 수도 있지요 !
// -> callback을 통해서 반환값을 전달하도록 합니다. 

static func uploadImage(image: UIImage, completion: @escaping(String) -> Voide) {
guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
let filename = NSUUID().uuidString
let ref = Storage.storage().reference(withPath: “/profile_images/\(filename)”)

ref.putData(imageData, metadata: nil) { _, errar in
if let error = error {
print(“에러: 프로필 이미지 업로드에 실패하였습니다. \(error.localizedDescription)”)
return
}
print(“성공: 프로필 이미지 업로드에 성공하였습니다.”)

ref.downloadURL { url, _ in 
guard let imageUrl = url?.absoluteString else { return }
completion(imageUrl)
}
}
}
}
}

//
// 1) 이미지 업로드도 하고
// 2) 사용자가 등록이 완료되면 !
// 
// 이미지 업로드는 완료되어야 함 !
// 

func register(withEmail email: String, 
password: String, image: UIImage?, 
fullname: 
// 1. 이미지를 업로드 하면서
// 1-1. 사용자도 같이 등록합니다. 
// 1-2. 사용자 등록 정보와 프로필 이미지 경로를 함께 받아옴
// 1-3. 데이터베이스에 저장합니다. 

guard let image = image else { return }

ImageUploader.uploadImage(image: image) { imageUrl in
Auth.auth().createUser(withEmail: email, password: password) { result, error in 
if let error = error {
print(“에러: 사용자 등록에 실패하였습니다. \(error.localizedDescription)”)
return
}
guard let user = result?.user else { return }
self.userSession = user
print(“성공: 사용자 등록에 성공하였습니다.”)

let data = [“email”: email, 
“usename”: username, 
“fullname”: fullname, 
“profileImageUrl”: imageUrl, 
“uid”: user.uid
]

Firestore.firestor().collection(“users”).document(user.uid).setData(data) { _ in
print(“ 성공: 사용자 정보를 저장하였습니다.”)
self.userSession = user
}
}
}
}
