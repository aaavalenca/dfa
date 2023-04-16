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
                GoodbyeView().environmentObject(global)
            }
        }
    }
}


struct GoodbyeView: View{
    @EnvironmentObject var global: Global
    var body: some View{
        VStack{
            Text("You won!")
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
            Text("This puzzle was created by André Valença for the WWDC Challenge...")
                .foregroundColor(.white)
            
            Button("RETURN", action: {
                global.levelNum = 0
            })
            .buttonStyle(CustomButton(myColor: .blue))
        }
    }
}

// button customization
struct CustomButton : ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    var myColor : Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 80, maxWidth: 150, minHeight: 40, maxHeight: 80)
            .background(isEnabled ? myColor : .gray)
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(10)
            .controlSize(.large)
    }
}


