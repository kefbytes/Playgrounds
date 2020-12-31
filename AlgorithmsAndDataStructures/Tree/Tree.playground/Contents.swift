import UIKit


struct Queue<Element> {
    
    var elements = [Element]()
    init () { }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var peek: Element? {
        return elements.first
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        elements.append(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : elements.removeFirst()
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: elements)
    }
}
class TreeNode<T> {
    
    var value: T
    var children = [TreeNode]()
    
    init( _ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode) {
        self.children.append(child)
    }
    
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return String(describing: value)
    }
}

// Traversals
extension TreeNode {
    // Depth First Traversal - Left to Right for each node
    func forEachDepthFirst(_ visit: (TreeNode) -> Void) {
       visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit)
        }
    }
    
    // Level Order Traversal - Node level by node level
    func forEachLevelOrder(_ visit: (TreeNode) -> Void) {
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {
            _ = queue.enqueue($0)
        }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach {
                _ = queue.enqueue($0)
            }
        }
    }
}

// Search
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        forEachLevelOrder { node in
            if node.value == value {
                result = node
            }
        }
        return result
    }
}

let beverages = TreeNode<String>("Beverages")

let hot = TreeNode<String>("Hot")
let tea = TreeNode<String>("Tea")
let coffee = TreeNode<String>("Coffee")
hot.add(tea)
hot.add(coffee)

let cold = TreeNode<String>("Cold")
let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")
cold.add(soda)
cold.add(milk)

beverages.add(hot)
beverages.add(cold)

print(beverages)
beverages.children.forEach {
    print("\t\($0)")
    print("\t\t\($0.children)")
}
print("--------------------------")
beverages.forEachDepthFirst {
    print($0)
}
print("--------------------------")
beverages.forEachLevelOrder {
    print($0)
}
print("--------------------------")
if let searchResult = beverages.search("Soda") {
    print(searchResult.value)
} else {
    print("could not find search item")
}

