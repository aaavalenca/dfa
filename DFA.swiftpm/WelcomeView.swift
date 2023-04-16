import Foundation
import SwiftUI

struct WelcomeView: View{
    @EnvironmentObject var global: Global
    @State var popover : Bool = false
    @State var fadeout : Bool = true
    
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
                                global.levelNum += 1
                            }
                            .buttonStyle(CustomButton(myColor: Color(red: 13/255, green: 0, blue: 160/255) , myColor2: Color(red: 1/255, green: 197/255, blue: 32/255)))
                            
                            
                            NavigationLink(destination: OnBoardingView(), isActive: $popover) { EmptyView()
                                
                            }
                            
                            Button ("WHAT?"){
                                popover.toggle()
                            }
                            .buttonStyle(CustomButton(myColor: Color(red: 190/255, green: 0, blue: 0) , myColor2: Color(red: 187/255, green: 191/255, blue: 0)))
                        }
                    }.padding(.bottom, 60)
                }.zIndex(1)
                    .onAppear(perform: {
                        withAnimation(.easeIn(duration: 3.0).delay(2)) {
                            fadeout = false
                        }
                    })
                
                
                if fadeout {
//                    Color.black.ignoresSafeArea()
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

struct OnBoardingView: View{
    @Environment(\.presentationMode) var presentation

    var body: some View{
        ZStack{
            Color.black
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    Text("DETERMINISTIC FINITE AUTOMATA")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("WHAT ARE THOSE??")
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    
                    Text("Well, to put it bluntly, a DFA is a computational model. The simplest one, actually! It has several states and they change given a certain input.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("States are usually represented by circles. And to transition between states, the machine has to read a symbol. A char in a string, for instance. The entire string is the input. The set of chars that a machine recognizes is what we call the alphabet.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("The alphabet defines the amount of transitions each state has. Because a DFA is deterministic, that is, it has to do something given a certain input. It can't just lie there. So, for each state, we'll have arrows coming out of it the same amount as the number of char in an alphabet.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("Every DFA has a starting point and an end point. If")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("<==== BACK")
                            .background(.green)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

//struct Rocket : View {
//    @State private var idx : Int = 1
//    private let timer = Timer.publish(every: 0.07, on: .main, in: .common).autoconnect()
//    var body: some View{
//        ZStack{
//            Image("foguetin" + "\(idx)")
//                .resizable()
//                .scaledToFit()
//                .onReceive(timer) { _ in
//                        self.idx = self.idx < 3 ? self.idx + 1 : 1
//                }
//        }
//    }
//}
