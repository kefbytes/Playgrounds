import UIKit

let words = ["Hannah", "Noah", "Kate", "Buddy", "Rosie"]
let wordsString = words.joined(separator: ", ")
print(wordsString)
print("------------------------------------------------------------------")

// Leetcode 1. Two Sum
// Brute Force Solution
func findTwoNumbers(withArray intArray: [Int], target: Int) -> (Int,Int) {
    var answer = (0,0)
    var indexOfFirstNum = 0
    while indexOfFirstNum <= intArray.count -  1 {
        for (index, num) in intArray.enumerated() {
            if index ==  indexOfFirstNum {
                continue
            }
            if intArray[indexOfFirstNum] + num == target {
                answer = (index, indexOfFirstNum)
                break
            }
        }
        indexOfFirstNum += 1
    }
    return answer
}
print(findTwoNumbers(withArray: [2, 7, 11, 15], target: 22))
print("------------------------------------------------------------------")

// More elegant solution
func findTwoNumbersVersionTwo(withArray intArray: [Int], target: Int) -> (Int,Int)? {
    var elementsDict = [Int: Int] ()
    for (index, num) in intArray.enumerated() {
        let complement = target - num
        if elementsDict.values.contains(complement) {
            guard let key = elementsDict.getKey(forValue: complement) else {
                break
            }
            return (index, key)
        }
        elementsDict[index] = num
    }
    return nil
}

extension Dictionary where Value: Equatable {
    func getKey(forValue val: Value) -> Key? {
        return first(where: {$1 ==  val})?.key
    }
}
print(findTwoNumbers(withArray: [2, 7, 11, 15], target: 26))
print("------------------------------------------------------------------")

// Leetcode 2. Add Two Numbers
func addTwoNumbers(firstNum: [Int], secondNum: [Int]) -> Int {
    var first = ""
    var second = ""
    for num in firstNum.reversed() {
        first.append("\(num)")
    }
    for num in secondNum.reversed() {
        second.append("\(num)")
    }
    return (Int(first) ?? 0) + (Int(second) ?? 0)
}

print(addTwoNumbers(firstNum: [2,4,3], secondNum: [5,6,4]))
print("------------------------------------------------------------------")

// Check for Palindromin: Assumption is String or Int
func isPalindrome<Value>(value: Value) -> Bool {
    var valueAsString: String
    if let num = value as? Int {
        valueAsString = String(num)
    } else {
        valueAsString = "\(value)"
    }
    
    let valueAsArray = Array(valueAsString.lowercased())
    if valueAsArray == valueAsArray.reversed() {
        return true
    }
    return false
}

print(isPalindrome(value: 10801))
print("------------------------------------------------------------------")

// Homemade reverse array func
func reverseAnArray<Value>(values: [Value]) -> [Value] {
    var result = [Value]()
    for item in values {
        result.insert(item, at: 0)
    }
    return result
}

print(reverseAnArray(values: ["Hannah", "Noah", "Kate", "Buddy", "Rosie"]))
print("------------------------------------------------------------------")
// Check is something is an Anagram
func isAnagram(firstWord: String, secondWord: String) -> Bool {
    if firstWord.count != secondWord.count {
        return false
    }
    if firstWord.lowercased().sorted(by: < ) == secondWord.lowercased().sorted(by: < ) {
        return true
    }
    return false
}

print(isAnagram(firstWord: "Hannah", secondWord: "nnhhaa"))
print("------------------------------------------------------------------")

// Remove all but braces, brackets and curly braces
func removeUneededCharacters(input: String) -> String {
    let stringArray = Array(input)
    let filteredArray = stringArray.filter {["(",")","{","}","[","]"].contains($0)}
    return String(filteredArray)
}

// Check if a String has balanced brackets
func isBalanced(inputString: String) -> Bool {
    let cleanedString = removeUneededCharacters(input: inputString)
    let partners: [Character:Character] = ["(":")","[":"]","{":"}"]
    var stack = [Character]()
    for char in cleanedString {
        if let value = partners[char] {
            stack.append(value)
        } else if stack.last == char {
            stack.popLast()
        } else {
            return false
        }
    }
    return stack.isEmpty
}

print(isBalanced(inputString: "[(Han[]na{}h)]"))
print("------------------------------------------------------------------")

// Switch two characters in a String
func switchTwoCharacters(inString inputString: String, at indexes: (Int, Int)) -> String {
    var stringArray = Array(inputString)
    stringArray.swapAt(indexes.0, indexes.1)
    let resultString = String(stringArray)
    return resultString
}

print(switchTwoCharacters(inString: "aab", at: (1,2)))
print("------------------------------------------------------------------")

// Permutations of Array
func permutations(_ arrayCount: Int, _ charArray: inout Array<Character>) {
    if arrayCount == 1 {
        print(charArray)
        return
    }
    for i in 0 ..< arrayCount - 1 {
        permutations(arrayCount - 1, &charArray)
        charArray.swapAt(arrayCount - 1, (arrayCount % 2 == 1) ? 0 : i)
    }
    permutations(arrayCount - 1, &charArray)
}

var testArray = Array("123")
permutations(testArray.count, &testArray)
print("------------------------------------------------------------------")

// Map
let arrayOfFirstNames = ["Hannah","Noah","Rosie","Buddy"]
let fullNamesArray = arrayOfFirstNames.map {$0 + " Franks"}
print(fullNamesArray)

// Filter
let kidsArray = fullNamesArray.filter {$0.contains("ah")}
print(kidsArray)
print("------------------------------------------------------------------")
