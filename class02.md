1. review 
c - null이 가능하지만 (ex.void) 불가능하게 한다. 
swift - nill이 불가능하지만 가능하게 한다. 

함수 = 기능
함수의 구성요소 - 반환값, 매개변수, 함수이름 
일급함수 - 함수를 매개변수, 반환값으로 사용 가능하다. 
함수를 값처럼 다룬다. 

(cpp - template) generic 타입을 강제하기위해 사용한다. 
c, cpp, java 는 함수를 반환할 수 없다. 

2. mvc mvvm
아이폰은 어떻게 구성되어있는가

하드웨어 - iPhone, iMac ..

운영체제(OS) iOS 의 구성
core os  
core service network, gps ..
media disc(ex.ssd 128gb, 256gb ..)
cocoa touch 별도 분리
cocoa touch 가 개발 진입점이기 때문에 
ui 를 못 다루면 ios 개발을 할 수 없다. 
application

uikit을 잘 사용할 수 있는가?
swiftui 를 사용할 수 있는가?

안드로이드의 구성
Linux kernal 을 가져다 사용
핵심 library
framework 내부에 cocoa touch가 포함되어 있다 
그래서 사진, 동영상, 머신러닝 등을 사용하고 속도를 향상시키기 위해서는 
java 에서 c 로 변환되는 과정까지 이해할 수 있어야 한다. 
application
 
MVC (iOS)
MVP (MS C#)
MVVM (현재 iOS)

mainstoryboard 를 삭제하면 파일을 찾을 수 없다고 오류가 난다. 
main interface 문제가 아니다. 
info.plist - application scene manifest - scene configuration - application session role  item 0 - 세번째 항목 제거
까만 화면

아이폰 어플 실행 - info.plist 읽음 - main.appdelegate - scene delegate - rootviewcontroller 

씬 > window > view


3. 인스타그램 clone - 기능 design

