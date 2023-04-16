import Foundation
import SwiftUI

struct WelcomeView: View{
    @EnvironmentObject var global: Global
    @State var popover : Bool = false
    
    var body: some View{

            NavigationView {
                ZStack{
                    Color.purple.brightness(-0.8).ignoresSafeArea()
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
//                    Image("cover")
//                        .resizable()
//                        .scaledToFill()
//                        .ignoresSafeArea()
                    
                    Route(level: "cover")
                        .colorMultiply(Color(.white))
                    
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
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct OnBoardingView: View{
    var body: some View{
        ZStack{
            Color.green
            VStack{
                Text("Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding OnboardingOnboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding Onboarding ")
                    .fixedSize(horizontal: false, vertical: true)
            }.padding()
        }
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
