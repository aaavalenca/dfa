// ORIENTATION MODE OF THE APP IS PORTRAIT

import Foundation
import SwiftUI

struct WelcomeView: View{
    @State var popover : Bool = false
    @State var game : Bool = false
    @State var fadeout : Bool = true
    @StateObject var viewModel = LevelViewModel()
    
    var body: some View{
        
        NavigationView {
            ZStack{
                ZStack{
                    Route(level: "cover")
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        HStack() {
                            Button ("GO ON"){
                                game.toggle()
                            }
                            .buttonStyle(CustomButton(myColor: Color(red: 13/255, green: 0, blue: 160/255) , myColor2: Color(red: 1/255, green: 197/255, blue: 32/255)))
                            
                            NavigationLink(destination: OnBoardingView(), isActive: $popover) { EmptyView()
                                
                            }
                            
                            NavigationLink(destination: LevelOneView(isActive: $game), isActive: $game) { EmptyView()}
                            
                            Button ("WHAT?"){
                                popover.toggle()
                            }
                            .buttonStyle(CustomButton(myColor: Color(red: 190/255, green: 0, blue: 0) , myColor2: Color(red: 187/255, green: 191/255, blue: 0)))
                        }
                    }.padding(.bottom, 60)
                }.zIndex(1)
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 1.0).delay(1)) {
                            fadeout = false
                        }
                    })
                
                if fadeout {
                    Image("cover")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .zIndex(2)
                }
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
