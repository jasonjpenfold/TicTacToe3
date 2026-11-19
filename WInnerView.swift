import SwiftUI

struct WinnerView: View{
    @Environment(Game.self) private var model
    var body: some View{
        Text("Well done:  \(model.playerTurn.description) wins!")
            .bold()
            .font(.title)
    }
}
