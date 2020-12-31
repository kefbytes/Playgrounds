import UIKit

class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T) {
        self.value = value
    }
    
    init(value: T, parent: Node) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

let beverages = Node(value: "beverages")

let hotBeverages = Node(value: "hot", parent: beverages )
let teaBeverages = Node(value: "tea", parent: hotBeverages)
teaBeverages.add(child: Node(value: "black", parent: hotBeverages))
teaBeverages.add(child: Node(value: "green", parent: hotBeverages))
teaBeverages.add(child: Node(value: "chai", parent: hotBeverages))
hotBeverages.add(child: teaBeverages)
hotBeverages.add(child: Node(value: "coffee", parent: beverages))
hotBeverages.add(child: Node(value: "cocoa", parent: beverages))

let coldBeverages = Node(value: "cold", parent: beverages)
let sodaBeverages = Node(value: "soda", parent: coldBeverages)
sodaBeverages.add(child: Node(value: "ginger ale", parent: coldBeverages))
sodaBeverages.add(child: Node(value: "bitter lemon", parent: coldBeverages))
coldBeverages.add(child: sodaBeverages)
coldBeverages.add(child: Node(value: "milk", parent: beverages))

beverages.add(child: hotBeverages)
beverages.add(child: coldBeverages)

print("--------- Beverages ---------")
for bev in beverages.children  {
    print("\(String(describing: bev.value))")
    for node in bev.children {
        print(".....\(String(describing: node.value))")
        for leaf in node.children {
            print("...........\(String(describing: leaf.value))")
        }
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map {$0.description}.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

if let searchItem = beverages.search(value: "Xevia") {
    print("\(searchItem) item exists in the tree")
} else {
    print("That item does not exist in the tree")
}

