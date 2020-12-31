import UIKit
import Foundation

let sortedNumbersArray = [1,5,15,17,19,22,24,31,105,150]

extension Array where Iterator.Element == Int {
    
    func containsUsingBinarySearch(_ value: Int) -> Bool {
        var lowerBound = 0
        var upperBound = self.count - 1
        var middleIndex = 0
        var found = false
        
        while lowerBound <= upperBound {
            middleIndex = (lowerBound + upperBound) / 2
            if self[middleIndex] == value {
                found = true
                break
            } else if self[middleIndex] < value {
                lowerBound = middleIndex + 1
            } else {
                upperBound = middleIndex - 1
            }
        }
        return found
    }
    
}

print(sortedNumbersArray.containsUsingBinarySearch(17))
