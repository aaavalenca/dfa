import SwiftUI

struct ContentView: View {
    @State var onboarding : Bool = true
    @StateObject var viewModel = LevelViewModel()
    @EnvironmentObject var global : Global
    
    var body: some View {
        ZStack{
            Color.purple.brightness(-0.8).ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if global.levelNum == 0 {
                WelcomeView().environmentObject(global)
            }
            // take as many 👽 as you need and return to your planet
            else if global.levelNum == 1{
                Level(levelModel: viewModel.allLevels[0])
                    .environmentObject(global)
                // An odd number of 👽
            } else if global.levelNum == 2{
                Level(levelModel: viewModel.allLevels[1])
                    .environmentObject(global)
                // Even 👽. Change only the ending state
            } else if global.levelNum == 3{
                Level(levelModel: viewModel.allLevels[2])
                    .environmentObject(global)
            }
            // At least one occurence of 👽👽. That is, in your quest, you should capture at least once a consecutive 👽👽
            else if global.levelNum == 4 {
                Level(levelModel: viewModel.allLevels[3])
                    .environmentObject(global)
            }
            // Goodbye screen
            else if global.levelNum == 5 {
                VStack{
                    Text("Ganhou, môpi!")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 50))
                    // goodbye!
                    
                    Button("RETURN", action: {
                        global.levelNum = 0
                    })
                    .buttonStyle(CustomButton(myColor: .white))
                    .font(.system(size: 60))
                }
            }
        }
    }
}

struct WelcomeView: View{
    @EnvironmentObject var global: Global
    
    var body: some View{
        VStack{
            Text("WELCOME ABOARD!")
                .bold()
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(20)
            HStack{
                Button("CONTINUE", action: {
                    global.levelNum += 1
                })
                .buttonStyle(CustomButton(myColor: .white))
                Button("WHAT IS THIS?", action: {
                    print("Onboarding")
                })
                .buttonStyle(CustomButton(myColor: .white))
            }
        }
    }
}
struct OnBoardingView: View{
    var body: some View{
        VStack{
            Text("Onboarding")
        }
    }
}

// button customization
struct CustomButton : ButtonStyle {
    var myColor : Color
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isEnabled ? .blue : .red)
            .foregroundColor(myColor)
            .clipShape(Capsule())
    }
}
