import UIKit

struct Queue<T> {
    
    var array = [T]()
    init () { }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        return array.first
    }
    
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
}

extension Queue: CustomStringConvertible {
    var description: String {
        return String(describing: array)
    }
}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(6)
queue.enqueue(17)
queue.enqueue(11)
print(queue)

queue.dequeue()
print(queue)

