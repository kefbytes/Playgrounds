import UIKit

// Start with this code
var firstName: String?
var lastName: String!
firstName = "Diana"
lastName = "Prince"

func printName(name: String) {
    print(name)
}

// 1.) Show optional binding again with if let
if let fname = firstName {
    printName(name: fname)
} else {
    print("firstName must be nil")
}

// 2.) Show original getFullName func and it's use
func getFullName() -> String? {
    if let first = firstName {
        return first + " " + lastName
    } else {
        return nil
    }
}
var fullName: String? = getFullName()
print("fullname = \(String(describing: fullName))")

// 3.) Change getFullName to use guard let
func getFullName2() -> String? {
    guard let first = firstName else {
        return nil
    }
    return first + " " + lastName
}
var fullName2: String? = getFullName2()
print("fullname = \(String(describing: fullName2))")

// 4.) Using Switch
switch firstName {
case .some(let fName):
    printName(name: fName)
default:
    print("firstName must be nil")
}

// 5.) Show force unwrap
let first: String = firstName!

// 6.) Combine optional chaining with multiple checks
var fName: String?
var lName: String?
fName = "Diana"
lName = "Prince"

if let first = fName, let last = lName {
    print("Complete name is: \(first) \(last)")
}

// 7.) Optional chaining, we first need to make a person object
struct Person {
    var firstName: String?
    var lastName: String?
    init () {
        firstName = "Diana"
        lastName = "Prince"
    }
}

// 8.) Now declare a person and then a variable to hold user.firstName showing the optional chaining
var user: Person?
var userFirstName = user?.firstName
user = Person()
userFirstName = user?.firstName

// 9.) Show NIL-Coalescing
var alias: String?
let heroAlias: String = alias ?? "Wonder Woman"
print(heroAlias)

// 10.) What an Optional really is
enum Optional<Wrapped> {
    case none
    case some(Wrapped)
}
