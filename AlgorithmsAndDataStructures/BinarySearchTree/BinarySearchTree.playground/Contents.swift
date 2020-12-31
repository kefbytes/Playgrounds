import UIKit
// --------------- BinaryNode ---------------
class BinaryNode<Element> {
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
    init(value: Element) {
        self.value = value
    }
}

// CustomStringConvertible
extension BinaryNode: CustomStringConvertible {
    var description: String {
        return diagram(for: self)
    }
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild, top + " ", top + "|––", top + "| ")
    }
}

// --------------- BinarySearchTree ---------------
struct BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryNode<Element>?
    init() { }
}

// CustomStringConvertible
extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = root else {
            return "Empty tree"
        }
        return String(describing: root)
    }
}

// Insert
extension BinarySearchTree {
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

// Search
extension BinarySearchTree {
    func contains(_ value: Element) -> Bool {
        var current = root
        while let node = current {
            if node.value == value {
                return true
            }
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        return false
    }
}

// Remove
extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

// Using the above elements
var binarySearchTree = BinarySearchTree<Int>()
binarySearchTree.insert(3)
binarySearchTree.insert(1)
binarySearchTree.insert(4)
binarySearchTree.insert(0)
binarySearchTree.insert(2)
binarySearchTree.insert(5)

print(binarySearchTree.contains(5))

