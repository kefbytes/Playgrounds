import UIKit

// Check for Prime numbers which are also Prime when digits are reversed
func isPrime(number: Int) -> Bool {
    guard number >= 2 else {
        return false
    }
    guard number != 2 else {
        return true
    }
    guard number % 2 != 0 else {
        return false
    }
    return !stride(from: 3, through: Int(sqrt(Double(number))), by: 2).contains {number % $0 == 0}
}

func backwardsNumber(forwardNumber: Int) -> Int {
    let stringVersion = String(forwardNumber)
    let reveresedString = String(stringVersion.reversed())
    if let reversedInt = Int(reveresedString) {
        return reversedInt
    } else {
        return 0
    }
    
}

func backwardsPrime(from num1: Int, to num2: Int) -> [Int] {
    var backwardsPrimesArray: [Int] = []
    for num in num1...num2 {
        if isPrime(number: num) {
            if isPrime(number: backwardsNumber(forwardNumber: num)) && num > 9{
                backwardsPrimesArray.append(num)
            }
        }
    }
    return backwardsPrimesArray
}
print(isPrime(number: 7))
print(backwardsPrime(from: 4, to: 79))
print("---------------------------------------------------------------------------")



