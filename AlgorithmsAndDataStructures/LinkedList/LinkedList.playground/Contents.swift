import UIKit

struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    init() { }
    
    mutating func push(value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(value: Value) {
        guard !isEmpty else {
            push(value: value)
            return
        }
        let node = Node(value:  value)
        tail?.next = node
        tail = node
    }
    
    func node(at index:Int) -> Node<Value>? {
        var currentIndex = 0
        var currentNode = head
        while(currentNode != nil && currentIndex < index) {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    func insert(_ value: Value, after node: Node<Value>) {
        node.next = Node(value: value, next: node.next)
    }
    
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
    }
    
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

class Node<Value> {
    
    var value: Value
    var next: Node?
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }

}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return"\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

var list = LinkedList<Int>()
list.push(value: 2)
list.push(value: 3)
list.push(value: 22)
list.append(value: 10)
list.append(value: 7)

if let someNode = list.node(at: 3) {
    list.insert(11, after: someNode)
}


print(list)
list.pop()
print(list)
list.removeLast()
print(list)

let index = 1
if let node = list.node(at: index - 1) {
    let removedValue = list.remove(after: node)
    print("removed \(String(describing: removedValue))")
    print(list)
}



