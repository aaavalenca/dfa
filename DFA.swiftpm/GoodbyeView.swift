// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct GoodbyeView: View{
    @Environment(\.presentationMode) var presentation
    @Binding var isActive : Bool

    var body: some View{
        
        ZStack{
            Color.black.ignoresSafeArea()
            Image("background").resizable().scaledToFill().ignoresSafeArea()
            VStack{
                Text("YOU WON!")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 60))
                    .padding(.top, 60)
                
                Spacer()
                Text("This puzzle was created\nby André Valença for the\nSwift Student Challenge of\nthe 2023 Apple Worldwide\nDevelopers Conference.\n\n Hope you liked it!")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Spacer()
                Button("RETURN", action: {
                    self.isActive.toggle()
                })
                .buttonStyle(CustomButton(myColor: Color(red: 30/255, green: 0, blue: 148/255), myColor2: Color(red: 134/255, green: 0, blue: 0)))
                .padding(.bottom, 60)
            }.navigationBarBackButtonHidden(true)
        }
    }
}


struct GoodbyeView_Previews: PreviewProvider {
    static var previews: some View {
        GoodbyeView(isActive: .constant(true))
    }
}
