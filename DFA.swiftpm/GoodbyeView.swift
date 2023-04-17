import SwiftUI

struct GoodbyeView: View{
    @Environment(\.presentationMode) var presentation    
    var body: some View{
        VStack{
            Text("You won!")
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
            Text("This puzzle was created by André Valença for the WWDC Challenge...")
                .foregroundColor(.white)
            
            Button("RETURN", action: {
                self.presentation.wrappedValue.dismiss()
            })
            .buttonStyle(CustomButton(myColor: Color(red: 30/255, green: 0, blue: 148/255), myColor2: Color(red: 134/255, green: 0, blue: 0)))
        }.navigationBarBackButtonHidden(true)
    }
}

