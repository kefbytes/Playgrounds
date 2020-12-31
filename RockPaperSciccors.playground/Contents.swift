import UIKit

// 1.) have them play once
// 2.) have them play ten times
// 3.) keep score first to 10 wins

/*
 create a function that returns a hand throw
 use the function to give a throw to each opponent
 compare the two throws to determine who won
 */

func throwWeapon() -> String {
    let randomNumber = Int.random(in: 0...2)
    switch randomNumber {
    case 0:
        return "Rock"
    case 1:
        return "Paper"
    case 2:
        return "Scissors"
    default:
        return "No weapon"
    }
}

func showdown(player1: String, player2: String) -> String {
    let weapons = (player1, player2)
    
    switch weapons {
    case ("Rock", "Rock"):
        return "Tie"
    case ("Rock", "Paper"):
        return "Player 2 wins"
    case ("Rock", "Scissors"):
        return "Player 1 wins"
    case ("Paper", "Rock"):
        return "Player 1 wins"
    case ("Paper", "Scissors"):
        return "Player 2 wins"
    case ("Paper", "Paper"):
        return "Tie"
    case ("Scissors", "Rock"):
        return "Player 2 wins"
    case ("Scissors", "Paper"):
        return "Player 1 wins"
    case ("Scissors", "Scissors"):
        return "Tie"
    default:
        return "No Game"
    }
}

func playGame(gameNum: Int) {
    let player1Weapon = throwWeapon()
    let player2Weapon = throwWeapon()
    print("Game \(gameNum)")
    print("player1Weapon \(player1Weapon)")
    print("player2Weapon \(player2Weapon)")
    print(showdown(player1: player1Weapon, player2: player2Weapon))
    print("------------------------------------------------------")
}

for num in 1...10 {
    playGame(gameNum: num)
}

