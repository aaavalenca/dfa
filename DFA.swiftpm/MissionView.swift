// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct MissionView : View {
    
    let objective : String
    @Binding var close : Bool
    
    var body: some View {
        VStack{
            Text("MISSION:\n==================>\n" + objective + "\n<==================\n* Starting point: 🏁 *\n* Finishing point: 🚀 *")
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .padding(40)
                .font(.custom("Courier-Bold", size: 100))
                .minimumScaleFactor(0.05)
                .lineSpacing(10)

            Button {
                self.close.toggle()
            } label: {
                Text("PLAY ==>")
                    .font(.custom("Courier-Bold", size: 30))
                    .background(.green)
                    .foregroundColor(.black)
            }
            .padding(40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
        .background(Color.black)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 40)
        )
    }
}
