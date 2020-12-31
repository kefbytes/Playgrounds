import UIKit
// Answer = CLT -> ORL -> SF -> DAL ->LAX

let unorderedFlights: [[String]] = [["ORL", "SF"],["DAL", "LAX"],["CLT", "ORL"],["SF", "DAL"]]

func printAnswer(inputArray: [[String]]) {
    var flightPath = [String]()
    for flight in inputArray {
        flightPath.append(flight.first!)
    }
    flightPath.append(inputArray.last![1])
    print(flightPath.joined(separator: " -> "))
}

// Simplest version -------------------------------------------------------------------------
func computeFlightPath1(inputArray: [[String]]) -> [[String]] {
    var originalLocation = ""
    let departures = inputArray.map { $0[0] }
    let arrivals = inputArray.map { $0[1] }

    for flight in departures {
        if !arrivals.contains(flight) {
            originalLocation = flight
        }
    }

    let firstFlight = inputArray.filter { $0.first == originalLocation}[0]
    let secondFlight = inputArray.filter { $0.first == firstFlight[1]}[0]
    let thirdFlight = inputArray.filter { $0.first == secondFlight[1]}[0]
    let fourthFlight = inputArray.filter { $0.first == thirdFlight[1]}[0]
    return [firstFlight, secondFlight, thirdFlight, fourthFlight]
}


// Refactored to remove for loop ------------------------------------------------------------
func computeFlightPath2(inputArray: [[String]]) -> [[String]] {
    let arrivals = inputArray.map { $0[1] }
    let firstFlight = (inputArray.filter { !arrivals.contains($0[0]) })[0]
    let secondFlight = inputArray.filter { $0.first == firstFlight[1]}[0]
    let thirdFlight = inputArray.filter { $0.first == secondFlight[1]}[0]
    let fourthFlight = inputArray.filter { $0.first == thirdFlight[1]}[0]
    return [firstFlight, secondFlight, thirdFlight, fourthFlight]
}


// Refactored to include inner recursive function -------------------------------------------
func computeFlightPath3(inputArray: [[String]]) -> [[String]] {
    let arrivals = inputArray.map { $0[1] }
    let firstFlight = (inputArray.filter { !arrivals.contains($0[0]) })[0]
    var flightPath: [[String]] = [firstFlight]
    
    func recursiveFlightBuilder(flight: [String]) {
        if flightPath.count == inputArray.count {
            return
        }
        let foundFlight = inputArray.filter { $0.first == flight[1]}[0]
        flightPath.append(foundFlight)
        recursiveFlightBuilder(flight: foundFlight)
    }
    recursiveFlightBuilder(flight: firstFlight)
    return flightPath
}

printAnswer(inputArray: computeFlightPath1(inputArray: unorderedFlights))
printAnswer(inputArray: computeFlightPath2(inputArray: unorderedFlights))
printAnswer(inputArray: computeFlightPath3(inputArray: unorderedFlights))

