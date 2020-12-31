import UIKit

func factorial(number: Int) -> Int {
    // base case
    if number == 0 {
        return 1
    }
    // recursive case
    return number * factorial(number: number - 1)
}

// 5 * factorial(4) = 5 * 24 = 120
// 4 * factorial(3) = 4 * 6
// 3 * factorial(2) = 3 * 2
// 2 * factorial(1) = 2 * 1
// 1 * factorial(0) = 1 * 1
// factorial(0) =  1
print(factorial(number: 5))

// 2^3 = 2 * 2 * 2 = 8
/*
    Stack
    2 * power(2, 2) = 2 * 4 =  8
    2 * power(2, 1) = 2 * 2
    2 * power(2, 0) = 2 * 1
    power(2, 0) = 1
 
*/
func power(number: Int, powerTo: Int) -> Int {
    
    // base case
    if powerTo == 0 {
        return 1
    } else { // recursive case
        return number * power(number: number, powerTo: powerTo - 1)
    }

}

print(power(number: 2, powerTo: 3))

