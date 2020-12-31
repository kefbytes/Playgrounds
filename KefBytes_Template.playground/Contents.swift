/*:
 ![alternate text ](KefBytes_Bird_Playground.png)
 ![alternate text ](KefBytes_TextLogo_Playground.jpeg)
 */
import UIKit

let myArray = [3,6,4,7,1,4,1,6,8,5,3,5,3,5,6,7]

func findLoneNumber(array: [Int]) -> [Int] {
    var resultsArray = [Int]()
    var duplicatesSet = Set<Int>()
    for item in array {
        if resultsArray.contains(item) {
            duplicatesSet.insert(item)
        }
        resultsArray.append(item)
    }
    let dups: [Int] = Array(duplicatesSet)
    for item in dups {
        resultsArray = resultsArray.filter{$0 != item}
    }
    return resultsArray
}

let answer = findLoneNumber(array: myArray)
print(answer)






