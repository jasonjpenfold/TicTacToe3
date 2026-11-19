import SwiftUI

enum Player{
    case x 
    case o 
}

struct Square{
    let position: Int
    private(set) var player: Player?
    var image: Image{
        switch self.player{
        
        case .x:
            return Image(systemName: "x.square")
        case .o:
            return Image(systemName: "o.square")
        default:
            return Image(systemName: "square")
        }
    }
    var canSelect: Bool{
        self.player == nil
    }
    
    init(position: Int, player: Player? = nil){
        self.position = position
        self.player = player
    }
    mutating func setPlayer(player: Player){
        if canSelect{
            self.player = player
        }
            }
}

@Observable
class Game{
    
    enum GameState: Equatable{

        case instructions
        case playing
        case winner(winner: Player)
        case draw
        
        
    }
    private(set) var gameState: GameState = .instructions
    private(set) var playerTurn: Player
    private(set) var board: [Square] = []
    private let winningLines: [Set<Int>] = [
        Set([0, 1, 2]),
        Set([3, 4, 5]),
        Set([6, 7, 8]),
        Set([0, 3, 6]),
        Set([1, 4, 7]),
        Set([2, 5, 8]),
        Set([0, 4, 8]),
        Set([2, 4, 6])
    ]
    
    var boardFull: Bool{
        board.filter{$0.player == nil}.count == 0
    }
    
    init(){
        self.playerTurn = .x
        for i in 0...8{
            self.board.append(Square(position: i))
        }
        
    }
    func setSquareAsPlayer(player: Player, position: Int){
        board[position].setPlayer(player: player)
    }
    func hasWon(player: Player)->Bool{
        let playerSquares: Set<Int> = Set(board.filter{$0.player == player}.compactMap{$0.position})
        for line in winningLines{
            if playerSquares.isSuperset(of: line){
                return true
            }
        }
        return false
    }
    func squareClicked(position: Int){
        // check square playable
        guard gameState == .playing else {return}
        guard board[position].canSelect else { return }
        // set square to player
        board[position].setPlayer(player: playerTurn)
        
        // check if won
        let playerHasWon = hasWon(player: playerTurn)
        if playerHasWon{
            gameState = .winner(winner: playerTurn)
            return
        }
        if boardFull{
            gameState = .draw
            return
        }
        playerTurn = playerTurn == .x ? .o : .x
        return
    }
}
