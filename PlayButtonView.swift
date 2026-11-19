import SwiftUI

struct PlayButtonView: View{
    @Environment(Game.self) private var model
    var body: some View{
        Button("Let's Play"){
            model.startGame()
        }
        .buttonStyle(.glassProminent)
    }
}
