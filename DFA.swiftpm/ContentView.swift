import SwiftUI

struct ContentView: View {
    
    @State var levelNum : Int = 1
    var body: some View {
        ZStack{
            Color.purple.brightness(-0.8).ignoresSafeArea()
            Image("background").scaledToFill()
            
            if levelNum == 1{
                Level(levelNum: $levelNum, level: "level\(levelNum)_", bodies: ["👽"], answer: ["👽"], xPos: [0.8, 0.82, 0.5, 0.2, 0.2], yPos: [0.7, 0.15, 0.06, 0.16, 0.68], angles: [110, 50, 0, -50, -120])
            } else if levelNum == 2{
                Level(levelNum: $levelNum, level: "level\(levelNum)_", bodies: ["👽"], answer: ["👽"], xPos: [0.8, 0.82, 0.5, 0.2, 0.2], yPos: [0.7, 0.15, 0.06, 0.16, 0.68], angles: [110, 50, 0, -50, -120])
            } else if levelNum == 3{
                
            }
        }
    }
}

struct Level : View {
    @Binding var levelNum : Int
    var level : String
    @State var bodies : [String]
    var answer : [String]
    var xPos : [CGFloat]
    var yPos : [CGFloat]
    var angles : [Double]
    
    let timer = Timer.publish(every: 0.8, on: .main, in: .common)
    
    @State private var selectedBody1 = "?"
    @State var won : Bool = false
    @State var pos : Int = 0
    
    var body : some View{
        VStack{
            Route(level: level)
                .overlay(
                    GeometryReader {geo in
                        
                        // Pickers
                        MenuPicker(bodies: $bodies, selectedBody: $selectedBody1)
                            .menuStyle(BodyMenu())
                            .position(x: geo.size.width * 0.5, y: geo.size.height * 0.06)
                        
                        // Rocket animation
                        Image("foguetin")
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
            
            Button("CONTINUE", action: {
                levelNum+=1
            })
            .buttonStyle(CustomButton(myColor: .white)).padding()
            .disabled(answer != [selectedBody1])
            .onChange(of: selectedBody1) { newValue in
                if [selectedBody1] == answer {
                    timer.connect()
                    won.toggle()
                }
            }
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
        }
    }
}

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
        ZStack{
            Image(level + "1")
            Image(level + "\(idx)")
                .animation(.easeInOut(duration: 2))
                .onReceive(timer) { _ in
                    withAnimation{
                        self.idx = self.idx < 7 ? self.idx + 1 : 0
                    }
                }
        }
    }
}
