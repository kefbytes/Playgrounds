import UIKit

// 1.) Create firstName var
var firstName: String?
var lastName: String!

//firstName = "Diana" // Step 7 below, then step 14 to comment
lastName = "Prince" // Step 10 below

// 2.) print firstName
//print(firstName as Any)
// comment out above line

// 3.) create printName func
func printName(name: String) {
    print(name)
}

// 4.) Call printName func
//printName(name: firstName) // remember the func wants a String but the var is an optional String

// 5.) wrap above in optional binding
if let fname = firstName {
    printName(name: fname)
} else {
    print("firstName must be nil")
}

// 6.) Provide else clause above
// 7.) Give firstName a value
// 8.) Create lastName var as implicity unwrapper optional do it above
// 9.) Call printName with lastName - experience crash
printName(name: lastName)

// 10.) Give lastName a value up above
// 11.) Create getFullName func that returns an optional
func getFullName() -> String? {
    if let first = firstName {
        return first + " " + lastName
    } else {
        return nil
    }
}

// 12.) Create fullName var
var fullName: String? = getFullName()

// 13.) print fullName with default value for nil
print("fullname = \(String(describing: fullName))")

// 14.) Comment out firstName value

