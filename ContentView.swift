import SwiftUI

struct ContentView: View {
    @Environment(Game.self) private var model
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Tic Tac Toe 3")
         /*   Text("model.board: \(model.board)")
            Text("model.boardFull: \(model.boardFull)")
            Button("Set x won 3,4,5"){
                model.setSquareAsPlayer(player: .x, position: 3)
                model.setSquareAsPlayer(player: .x, position: 4)
                model.setSquareAsPlayer(player: .x, position: 5)
            }
            Button("Check if X won:"){
                let won = model.hasWon(player: .x)
                print(won)
            }
          */
            Grid{
                ForEach(0..<3, id: \.self){
                        row in
                        GridRow{
                            ForEach(0..<3, id: \.self){
                            col in
                            SquareView(row: row, col: col)
                           
                        }
                    }
                }
                            }
            
        }
    }
}
