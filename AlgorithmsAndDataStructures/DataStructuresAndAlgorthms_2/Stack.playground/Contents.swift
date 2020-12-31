import UIKit

struct Stack<Element> {
    private var storage: [Element] = []
    init() { }
    
    mutating func push() {
        
    }
    
    mutating func pop() {
        
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "------------Top------------"
        let bottomDivider = "\n------------------------"
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
