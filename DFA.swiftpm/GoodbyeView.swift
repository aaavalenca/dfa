// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct GoodbyeView: View{
    @Environment(\.presentationMode) var presentation
    @Binding var isActive : Bool

    var body: some View{
        
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                
                Image("final")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.095)
                Text("YOU WON!")
                    .font(.custom("Courier-Bold", size: 50))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .padding(40)
                
                Text("This puzzle was made\nby André Valença for the\nSwift Student Challenge of\nthe 2023 Apple Worldwide\nDevelopers Conference.\n\nAssets were drawn on Figma.\n\nAmbience and sound effect\nwere created using royalty\nfree AI music generator\nSoundful.\n\nThanks!")
                    .font(.custom("Courier-Bold", size: 30))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(10)
                
                Button {
                    self.isActive.toggle()
                } label: {
                    Text("<==== BACK")
                        .font(.custom("Courier-Bold", size: 30))
                        .background(.green)
                        .foregroundColor(.black)
                }.padding(40)
            }.navigationBarBackButtonHidden(true)
        }
    }
}


struct GoodbyeView_Previews: PreviewProvider {
    static var previews: some View {
        GoodbyeView(isActive: .constant(true))
    }
}
