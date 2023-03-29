import SwiftUI

struct ContentView: View {
    @State var levelNum : Int = 4
    var body: some View {
        ZStack{
            Color.purple.brightness(-0.8).ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack{
                Text("LEVEL \(levelNum)")                           .bold()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
                // implement ? for doubts
                
                if levelNum == 0 {
                    //onboarding
                }
                
                // take as many 👽 as you need and return to your planet
                if levelNum == 1{
                    Level(levelNum: $levelNum,
                          level: "level\(levelNum)_",
                          bodies: ["👽"],
                          answer: ["👽", "?", "?", "?", "?", "?"],
                          pickerXPos: [0.5],
                          pickerYPos: [0.05],
                          xPos: [0.8, 0.82, 0.5, 0.2, 0.2],
                          yPos: [0.7, 0.15, 0.06, 0.16, 0.68],
                          angles: [110, 50, 0, -50, -120])
                    
                    // An odd number of 👽
                } else if levelNum == 2{
                    Level(levelNum: $levelNum,
                          level: "level\(levelNum)_",
                          bodies: ["👽", "🌒"],
                          answer: ["👽", "🌒", "👽", "🌒", "?", "?"],
                          pickerXPos: [0.5, 0.93, 0.5, 0.06],
                          pickerYPos: [0.05, 0.5, 0.96, 0.5],
                          xPos: [0.7, 0.82, 0.5, 0.2, 0.2],
                          yPos: [0.676, 0.15, 0.06, 0.16, 0.68],
                          angles: [160, 50, 0, -50, -120])
                    // Even 👽. Change only the ending state
                } else if levelNum == 3{
                    Level(levelNum: $levelNum,
                          level: "level\(levelNum)_",
                          bodies: ["👽", "🌒"],
                          answer: ["👽", "🌒", "👽", "🌒", "?", "?"],
                          pickerXPos: [0.5, 0.93, 0.5, 0.06],
                          pickerYPos: [0.05, 0.5, 0.96, 0.5],
                          xPos: [0.7, 0.82, 0.5, 0.2, 0.2],
                          yPos: [0.676, 0.15, 0.06, 0.16, 0.68],
                          angles: [160, 50, 0, -50, -120])
                }
                // At least one occurence of 👽👽. That is, in your quest, you should capture at least once a consecutive 👽👽
                else if levelNum == 4 {
                    Level(levelNum: $levelNum,
                          level: "level\(levelNum)_",
                          bodies: ["👽", "🌒"],
                          answer: ["👽", "👽", "👽", "🌒", "🌒", "🌒"],
                          pickerXPos: [0.5, 0.91, 0.88, 0.48, 0.1, 0.1],
                          pickerYPos: [0.05, 0.37, 0.67, 0.96, 0.63, 0.32],
                          xPos: [0.7, 0.82, 0.5, 0.2, 0.2],
                          yPos: [0.76, 0.15, 0.06, 0.16, 0.68],
                          angles: [160, 50, 0, -50, -120])
                }
                else {
                    VStack{
                        Text("Ganhou, môpi!")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 50))
                        // goodbye!
                        
                        Button("QUIT", action: {
                            print("Out")
                        })
                        .buttonStyle(CustomButton(myColor: .white))
                        .font(.system(size: 60))
                    }
                }
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

struct Level : View {
    @Binding var levelNum : Int
    var level : String
    // The "alphabet" of the automata
    @State var bodies : [String]
    var answer : [String]
    // Where will all the pickers be situated withing the level
    var pickerXPos: [CGFloat]
    var pickerYPos: [CGFloat]
    // The keyframes for animating the rocket, including angle
    var xPos : [CGFloat]
    var yPos : [CGFloat]
    var angles : [Double]
    // for animating the rocket
    let timer = Timer.publish(every: 0.8, on: .main, in: .common)
    // current step for rocket animation
    @State var pos : Int = 0
    
    // bodies for the picker to pick. It starts at "?", but there's only the alphabet options to choose
    @State private var selectedBody1 = "?"
    @State private var selectedBody2 = "?"
    @State private var selectedBody3 = "?"
    @State private var selectedBody4 = "?"
    @State private var selectedBody5 = "?"
    @State private var selectedBody6 = "?"
    // an array with all the selected bodies and current state
    @State var selectedBodies: [String] = []
    //winning condition
    @State var won : Bool = false
    @State var unlocked : Bool = true
    
    var body : some View{
        VStack{
            Route(level: level)
                .overlay(
                    GeometryReader {geo in
                        // Pickers
                        // Level 1 only has one picker
                        if unlocked{
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody1)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[0], y: geo.size.height * pickerYPos[0])
                        }
                        // Levels 2 and 3 have four pickers
                        if levelNum > 1 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody2)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[1], y: geo.size.height * pickerYPos[1])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody3)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[2], y: geo.size.height * pickerYPos[2])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody4)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[3], y: geo.size.height * pickerYPos[3])
                        }
                        // Levels 4 and 5 have six pickers
                        if levelNum > 3 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody5)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[4], y: geo.size.height * pickerYPos[4])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody6)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * pickerXPos[5], y: geo.size.height * pickerYPos[5])
                        }
                        
                        // Rocket animation
                        Image("foguetin")
                            .resizable()
                            .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.1)
                            .scaledToFit()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .rotationEffect(Angle(degrees: angles[pos]))
                            .position(x: geo.size.width * (xPos[pos]), y: geo.size.height * (yPos[pos]))
                            .animation(.linear(duration: 0.8), value: pos)
                    }.onReceive(timer, perform: { _ in
                        if pos < xPos.count - 1 && won{
                            pos = pos + 1
                        } else {
                            timer.connect().cancel()
                        }
                    })
                )
                .padding()
            // Continue to next stage. It's only able to tap when winning condition is met
            Button("CONTINUE", action: {
                unlocked.toggle()
                levelNum+=1
            })
            .padding(20)
            .buttonStyle(CustomButton(myColor: .white)).padding()
            .disabled(!won)
            .onChange(of: [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]) { _ in
                selectedBodies = [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]
                
                //winning condition
                if selectedBodies == answer {
                    timer.connect()
                    won.toggle()
                }
            }
        }.onAppear {
            self.selectedBodies.append(selectedBody1)
            self.selectedBodies.append(selectedBody2)
            self.selectedBodies.append(selectedBody3)
            self.selectedBodies.append(selectedBody4)
            self.selectedBodies.append(selectedBody5)
            self.selectedBodies.append(selectedBody6)
        }
    }
}

struct MenuPicker : View{
    @Binding var bodies : [String]
    @Binding var selectedBody : String
    
    var body: some View{
        Menu {
            Picker(selection: $selectedBody, label: EmptyView(), content: {
                ForEach(bodies, id: \.self) {
                    Text($0)
                }
            })
        } label: {
            Text(selectedBody)
                .font(.title2)
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

// picker customization
struct BodyMenu : MenuStyle{
    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)
            .font(.largeTitle)
            .frame(maxWidth: 60, maxHeight: 60)
            .background(.white)
            .cornerRadius(50)
            .accentColor(.black)
            .shadow(color: .white, radius: 20)
    }
}

struct Route : View {
    @State private var idx : Int = 0
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    var level : String
    var body: some View{
        // animation for space route arrows to move
        ZStack{
            Image(level + "1")
                .resizable()
                .scaledToFit()
            Image(level + "\(idx)")
                .resizable()
                .scaledToFit()
                .animation(.easeInOut(duration: 2))
                .onReceive(timer) { _ in
                    withAnimation{
                        self.idx = self.idx < 7 ? self.idx + 1 : 0
                    }
                }
        }
    }
}
