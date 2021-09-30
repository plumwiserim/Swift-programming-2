# 리뷰
- MVC 에 대해서 간단하게 소개
  - MVC 답답했던 점?
    - MVC 왜 쓰나?
  - MVC 를 분해해봅시다. 
    - M -> 모델 => 데이터베이스 스키마, JSON 구조, XML
    - C -> 컨트롤 => JS, Swift, 언어 명세들?!! ?????
    - V -> 뷰 => HTML, CSS, UIKit
  - 컨트롤러가 하는일은?
    - M을 가공해서 V에 전달
    - V에 전달된 이벤트를 가공해서 M에 전달
- 유제2) 그럼? MVVM은 MVC를 활용하나요?(문제발생구간)
  - MVC와 MVVM은 전혀 다르다 ! 완전 다르다 !
  - MVVM으로 인스타그램을 만들자
  - SwiftUI로 만들자
- 유제1) iOS는 MVC모델을 적극적으로 활용하는가?
  - 네
- iOS는 MVC모델을 왜 적극적으로 활용하는가?
  - 초창기에 GUI를 기반으로 하는 프로그램은 전부다 MVC!
  - 그러다보니 10년 전에는 MVC가 맞았음! => 사실상 업계 표준
- 그런데 iOS는 왜 MVC 모델에서 MVVM으로 적극적으로 이동하는가?
  - 답 : ㅇㅇㅇ기술의 장점은 무엇인가요? "효율적입니다"
  - 답 : ㅇㅇㅇ기술의 단점은 무엇인가요? "비효율적입니다"
  - M(assive) <-> 규모가 크다
  - MVC의 단점
    - MVC 의 가장 큰 단점 => 컨트롤러가 엄청 비대해진다. 
    - 규모가 커지면? => 수정이 힘들다. 
    - 수정이 힘들면? => 유지비용이 많이 든다. 
  - MVC의 개선
    - 컨트롤러를 작게 만들자!
    - 이벤트 정리가 안된다. 
  - MVC의 고질적인 단점
    - 컨트롤러가 너무 크다. 
    - 왜? V에 C를 전달하는데 뷰와 컨트롤러가 너무 결합되어있다. 
    - 컨트롤러를 분리한다. 
      - 로직을 담당하는 컨트롤러와 모델과 뷰를 담당하는 VM으로 대체한다. 
  # 인스타그램
  - 뷰가 변경하면 자동으로 컨트롤러가 연동되어서 모델까지 전달된다. 
    - 여러분이 맛집 가서 사진을 업로드해요
      => 한명의 유저가 자신의 사진을 데이터베이스에 저장
      => 뷰(인스타그램) - 컨트롤러(업로드) - 모델(사진)
  - 모델이 변경되면 자동으로 컨트롤러가 연동되어서 뷰가 변경된다. 
    - 모델(사진이 업로드되면) -> 컨트롤러(알림) - 뷰(인스타그램)
- 예제1) React.js는 MVC 모델 중 무엇을 대체하는가?
  - 페이스북은 왜 V와 C를 대체하는 라이브러리를 만들었는가?
  - HTML 사용하면 되지 않나요? => 부분 렌더링, html DOM이 불편해서, 기존의 HTML이 불편해서 만들었음
  - 그럼 왜? V를 수정안하고 C도 함게 개선하였는가?
  - "V를 수정한다는 건 있을 수 없는 일"
    - HTML을 왜 수정하지 못하죠? => 표준이기 때문입니다. 
    - 그럼 방법이 하나밖에 없어요.
      - "내(facebook)가 원하는 V를 위해서 C를 개선하여 V를 제공하는 수밖에 없음"
  - 반례) Django, Spring, RoR, Laravel 프레임워크는 모델, 컨트롤, 뷰를 전부를 통합패키지로 제공합니다. 
  
## 오늘 수업의 목표 중 하나
- MVVM 으로 진행
- "iOS 개발자가 되겠어!"
  - 1) 200만원 허들
  - 2) 핸드폰도 있어야 됨(100만)
  - 3) 장비를 구매하고 나면
  - 4) Swift 를 배울 기회가 적다
  - 5) 커뮤니티는 더 없다.
  - -------------
  - 6) UIKit, AutoLayout 기술적 허들 <- 폐사 구간

- "iOS 개발자가 되겠어"
  - 6) SwiftUI로 변경해서 학습
  - "우리는 반드시 앱을 작동하도록 만들어서 수업을 마친다"


## MVVM 으로 인스타그램 프로젝트 구조를 설계

앱을 쉽게 만들 수 있는 법
안드로이드 Jetpack Compose
iOS SwiftUI
React.js
세 종류 모두 힘들다면 백엔드


디자인 약속 목업(mock-up)
목업용 툴
- Figma ? 구글아이디만 있으면 홈페이지에서 바로 사용할 수 있다. 
- Adobe XD ?
- 스케치 ?

# SwiftUI(MVVM)으로 인스타그램 만들기

## Week1
- 프로젝트 설계
  - 기능 명세 => 인스타그램
  - 기술 정의 => 
    - 예전에는 Obj-C vs swift 
    - UIKit or SwiftUI 결정 => SwiftUI
    - Backend SaaS, AWS, ... => SaaS => Firebase
  - 폴더 구조 정하기 <= 구조 및 역할
  - 요즘에는 git을 많이 쓰기 때문에 폴더링을 잘해둬야 한다. 
  - 아래는 MVVM을 사용할 때 합리적인 폴더 구조
    - \ Root
    - Model
    - View <= 유스케이스
      - UploadPost
      - Feed
      - Comments
      - Search
      - Profile
      - Authetication
"authentication vs authorization"
인증(로그인) vs 권한(맞팔)
      - Notifications 알림
      - Main
    - ViewModel (Controller)
    - API
    - Utils
  - 
  - {데이터 모델, 구조, 유스케이스, 플로우차트}

## 하단바 TapView를 먼저 만들어보자!
- Main
  - TabView
- Search
- Upload
- Notification
  - NotificationsView (SwiftUI View)
- Profile

## FeedView <= 데이터 모델을 기반으로 한 더미 데이터 !
- Fake !
  - 더미 데이터 ! 

- Feed 모델
  - User Info
    - 사용자 이미지
    - 사용자 이름
  - Post Image
    - 포스트 이미지
  - Action Button
    - SF-Symbol
  - Caption
    - 텍스트
  - Comments 는 다른 View 로 나눠놓았기 때문에 지금 논의하지 않는다. 
- Feed View 구성
  - VStack
    - User Info
      - HStack
    - Post Image
    - Action Button
    - Caption
- SwiftUI를 사용하면 장점이 있어요 !
  - 모든 기기대응
  - 그래서 대부분의 것들을 비율/정렬로 결정해요 !