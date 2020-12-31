import UIKit

struct Stack<Element> {
    
    private var storage: [Element] = []
    
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "-----------top------------\n"
        let bottonDivider = "\n--------------------------"
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottonDivider
    }
}

var stack = Stack<Int>()
stack.push(11)
stack.push(7)
stack.push(4)
stack.push(16)
print(stack)

stack.pop()
print(stack)
