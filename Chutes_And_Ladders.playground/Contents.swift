import UIKit

class Spinner {
    static func spin() -> Int {
        return Int.random(in: 1...6)
    }
}

struct Board {
    static var squares: [Int: Int] = [1:37, 4:10, 9:22, 21:21, 28:56, 51:16, 71:20, 80:20, 17:-10, 54:-20, 62:-43, 87:-63, 93:-20, 95:-20, 98:-19]
}

struct Player {
    var startingSpot = 0
    var endingSpot = 0
    
    mutating func takeTurn(playerNumber: Int) -> Bool {
        print("player \(playerNumber) starts at square \(startingSpot)")
        let spin = Spinner.spin()
        print("spins a \(spin)")
        endingSpot = startingSpot + spin
        print("and moves to square \(endingSpot)")
        if let additionalMove = Board.squares[endingSpot] {
            endingSpot = endingSpot + additionalMove
            var moveDescription = ""
            if additionalMove > 0 {
                moveDescription = "finds a ladder and climbs to"
            } else {
                moveDescription = "steps in a chute and slides to"
            }
            print("there he/she \(moveDescription) square \(endingSpot)")
        }
        startingSpot = endingSpot
        if endingSpot >= 100  {
            return true
        } else {
            return false
        }
    }
}

struct Game {
    
    var players = Array(repeating: Player(), count: Int.random(in: 2...6))
    var gameOver = false
    
    mutating func start() {
        while !gameOver {
            for (index, player) in players.enumerated() {
                var currentPlayer = player
                if currentPlayer.takeTurn(playerNumber: index + 1) {
                    gameOver = true
                    print("Player \(index + 1) wins! 🏆")
                    break
                }
                print("--------------- Next Turn -----------------")
                players[index] = currentPlayer
            }
        }
    }
    
}

var game = Game()
game.start()


