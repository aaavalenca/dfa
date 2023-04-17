import SwiftUI

struct GoodbyeView: View{
    @Environment(\.presentationMode) var presentation
    @Binding var isActive : Bool

    var body: some View{
        
        ZStack{
            Color.black.ignoresSafeArea()
            Image("background").resizable().scaledToFill().ignoresSafeArea()
            VStack{
                Text("You won!")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                Text("This puzzle was created by André Valença for the WWDC Challenge...")
                    .foregroundColor(.white)
                
                Button("RETURN", action: {
                    self.isActive.toggle()
                })
                .buttonStyle(CustomButton(myColor: Color(red: 30/255, green: 0, blue: 148/255), myColor2: Color(red: 134/255, green: 0, blue: 0)))
            }.navigationBarBackButtonHidden(true)
        }
    }
}

