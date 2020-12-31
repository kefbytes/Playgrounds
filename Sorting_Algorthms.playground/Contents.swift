import UIKit

var numbersArray = [2,6,7,19,39,78,11,45,99,23,56,9]
print("non-sorted numbers")
print(numbersArray)
print("----------------------------")

func bubbleSortAnArray(numbers: [Int]) -> [Int] {
    guard numbers.count > 1 else { return numbers }
    var sortedArray = numbers
    for i in 0..<sortedArray.count {
        for j in 0..<sortedArray.count {
            if sortedArray[i] < sortedArray[j] {
                //            print("i = \(i)")
                //            print("j = \(j)")
                //            print("numbers[i] = \(numbers[i])")
                //            print("numbers[j] = \(numbers[j])")
                sortedArray.swapAt(i, j)
            }
            //        print("current numbers = \(numbers)")
            //        print("----------------------------")
        }
    }
    return sortedArray
}

print("sorted numbers")
//print(bubbleSortAnArray(numbers: numbersArray))

func selectionSortAnArray(_ numbers: [Int]) -> [Int] {
    guard numbers.count > 1 else { return numbers }
    var sortedArray = numbers
    for i in 0 ..< sortedArray.count {
        var minIndex = i
        for j in (i + 1)..<sortedArray.count {
            if sortedArray[j] < sortedArray[minIndex] {
                minIndex = j
            }
        }
        if i != minIndex {
            sortedArray.swapAt(i, minIndex)
        }
    }
    return sortedArray
}

//print(selectionSortAnArray(numbersArray))

func insertionSortingAnArray(_ numbers: [Int]) -> [Int] {
    guard numbers.count > 1 else { return numbers }
    var sortedArray = numbers
    for i in 0..<sortedArray.count {
        let key = sortedArray[i]
        var j = i - 1
        while j >= 0 && sortedArray[j] > key {
            sortedArray[j + 1] = sortedArray[j]
            j = j - 1
        }
        sortedArray[j + 1] = key
    }
    return sortedArray

}

print(insertionSortingAnArray(numbersArray))
