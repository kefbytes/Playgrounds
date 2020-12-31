import UIKit

func fizzBuzz(input: Int) -> String? {
    var answer: String?
    if input % 3 == 0 {
        answer = "Fizz"
    }
    if input % 5 == 0 {
        answer = "Buzz"
    }
    if input % 15 == 0 {
        answer = "FizzBuzz"
    }
    return answer
}

func playFizzBuzz() -> [String?] {
//    var arrayOfNumbers: [String?] = []
//    for num in 1...Int.random(in: 10...500) {
//        arrayOfNumbers.append(fizzBuzz(input: num))
//    }
//    return arrayOfNumbers
    
    
    var arrayOfNumbers: [String?] = []
    for num in 1...Int.random(in: 10...500) {
        arrayOfNumbers.append(fizzBuzz(input: num))
    }
    return arrayOfNumbers
}

//print(playFizzBuzz())


let oneTwoThree = Array(1...3).map {$0 * 2}
print("pre-map = \(oneTwoThree)")
let mappedArray = oneTwoThree.map {$0 * 2}
print("post-map = \(mappedArray)")

let arraySize = Int.random(in: 1...15)
let randomArray: [Int] = Array(repeating:1..<arraySize, count:arraySize)
let fizzBuzzArray = randomArray.map {fizzBuzz(input: $0)}
print(fizzBuzzArray)



