import UIKit

for num in 1...100 {
    var fizzBuzzString = ""
    if num % 3 == 0 {
        fizzBuzzString = "Fizz"
    }
    if num % 5 == 0 {
        fizzBuzzString += "Buzz"
    }
    print("🤖🔸🔸🔸🤖\(num) \(fizzBuzzString)")
}

for num in 1...100 {
    var fizzBuzzString = ""
    switch (num % 3 == 0, num % 5 == 0) {
    case (true, true):
        fizzBuzzString = "FizzBuzz"
    case (true, false):
        fizzBuzzString = "Fizz"
    case (false, true):
        fizzBuzzString = "Buzz"
    default:
        fizzBuzzString = ""
    }
    print("\(num) \(fizzBuzzString)")
}
