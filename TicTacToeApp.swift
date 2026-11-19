import SwiftUI

@main
struct TicTacToeApp: App {
    @State private var model = Game()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
