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
                    
                VStack (spacing: 0){
                    Spacer()
                    Text("WELCOME ABOARD,")
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    
                    Text("Deterministic Finite Astronauts")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding(20)
                    Spacer()
                    
                    Rocket().rotation3DEffect(Angle(degrees: 210), axis: (x: 0, y: 0, z: 1)).frame(maxWidth: 200).padding()
                    
                    Spacer()
                    HStack() {
                        Button ("GO ON"){
                            global.levelNum += 1
                        }
                        .buttonStyle(CustomButton(myColor: .blue))
                        
                        NavigationLink(destination: OnBoardingView(), isActive: $popover) { EmptyView()
                            
                        }
                        
                        Button ("WHAT?"){
                            popover.toggle()
                        }
                        .buttonStyle(CustomButton(myColor: .green))
                        
                    }
                    Spacer()
                }
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

struct Rocket : View {
    @State private var idx : Int = 1
    private let timer = Timer.publish(every: 0.07, on: .main, in: .common).autoconnect()
    var body: some View{
        ZStack{
            Image("foguetin" + "\(idx)")
                .resizable()
                .scaledToFit()
                .onReceive(timer) { _ in
                        self.idx = self.idx < 3 ? self.idx + 1 : 1
                }
        }
    }
}
