import SwiftUI

struct SquareView: View{
    @Environment(Game.self) private var model
    let row: Int
    let col: Int
    var body: some View{
    
            
            
        ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(Color.white)
                    .frame(width: 100,height: 100)
                    .padding()
                    .shadow(radius: 10)
                
                let position = (row * 3) + col
               // Text("\(position)")
            //Image(systemName: "circle.fill")
            let image = model.board[position].image
            image
                .font(.system(size: 80))
                
                
            
        }
    }
}

