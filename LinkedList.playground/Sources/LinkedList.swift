import Foundation

public struct LinkedList {
    public var head: Node?
    public var tail: Node?
    
    public init() {
        
    }
    
    //추가
    // - Node 복사
    // - head가 nil인지 판단
    // - head가 nil이면 head
    // - head가 nil이 아니라면
    // - tail에 붙여넣음 /// 왜 안 head 뒤?
    //
    
    private func copyNodes() {
        // ? 이 붙으면.. 난리가 난다.
        // 안에 값이 있는지 없는지 모르므로 if head == nil을 매번 해줘야 한다.
        // Not found ==> "알 수 없는 메모리입니다.. "
        
        // 선행탈출
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        // head가 있음 무조건 있음 없으면 사기 !
        guard var oldNodes = hea else {
            return nil
        }
        
        head = Node(value: oldNodes.value)
        var newNode = head
        var nodeCopy = Node?
        
    }
    
    //삭제
    
    //조회
    
}
