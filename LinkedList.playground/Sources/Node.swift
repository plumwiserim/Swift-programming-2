import Foundation

// Swift 클래스 문법
public class Node {
    // var 는 상수입니까? 변수입니까?
    public var value: Int
    // next Node인데, 무조건 Node가 존재함!
    // next가 없다(empty)는 존재하지 않아요!
    // 처음에 링크드 리스트를 만들면 다음 Node가 없음?!
    
    //스위프트는 널을 허용하지 않으므로
    //널이 필요하다고 생각되면 설정해줘야 한다.
    public var next: Node?
    
    public init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
