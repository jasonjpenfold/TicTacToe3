import SwiftUI

struct DrawView: View{
    @Environment(Game.self) private var model
    var body: some View{
        Text("Oh dear it's a draw. Better luck next time")
    }
}
