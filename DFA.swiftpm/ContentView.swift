import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack{
            Color.purple.brightness(-0.8).ignoresSafeArea()
            Image("background").scaledToFill()
            Level1()
//            GeometryReaderAnimation()
        }
    }
}

struct GeometryReaderAnimation: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var animate = false
    var body: some View {
        GeometryReader { geo in
            Circle()
                .fill(.gray)
                .frame(width: 30)
                .position(CGPoint(x: Double.random(in: 10..<geo.size.width), y: Double.random(in: 10..<geo.size.height)))
                .animation(.spring(), value: animate)
        }
        .onReceive(timer, perform: { _ in
            animate.toggle()
        })
    }
}

struct Level1 : View {
    var bodies = ["👽"]
    var answer = ["👽"]
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()

    @State private var selectedBody1 = "?"
    @State var won : Bool = false
    @State var pos : Int = 0
    var xPos : [CGFloat] = [0.8, 0.82, 0.5, 0.2, 0.2]
    var yPos : [CGFloat] = [0.7, 0.15, 0.06, 0.16, 0.68]
    var angles : [Double] = [110, 50, 0, -50, -120]
    
    var body : some View{
        
        VStack{
            Route1()
                .overlay(
                    GeometryReader {geo in
                        Menu {
                            Picker(selection: $selectedBody1, label: EmptyView(), content: {
                                ForEach(bodies, id: \.self) {
                                    Text($0)
                                }
                            })
                        } label: {
                            Text(selectedBody1)
                        }
                        .menuStyle(BodyMenu())
                        .position(x: geo.size.width * 0.5, y: geo.size.height * 0.06)
                        
                        Image("foguetin")
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                            .rotationEffect(Angle(degrees: angles[pos]))
//                            .rotationEffect(Angle(degrees: -120))
                            .position(x: geo.size.width * (xPos[pos]), y: geo.size.height * (yPos[pos]))
//                            .position(x: geo.size.width * 0.2, y: geo.size.height * 0.68)
                            .animation(.linear(duration: 0.8), value: pos)
                    }
                        .onReceive(timer, perform: { _ in
                            if pos < xPos.count - 1{
                                pos = pos + 1
                            } else {
                                timer.upstream.connect().cancel()
                            }
                        })
                )
            
            Button("CONTINUE", action: {
//                if pos < xPos.count - 1{
//                    print(pos)
//                    print(xPos.count)
//                    print(xPos[pos])
//                    pos = pos + 1
//                }
            })
            .buttonStyle(CustomButton(myColor: .white)).padding()
            .disabled(answer != [selectedBody1])
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

struct Route1 : View {
    @State private var idx = 0
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    
    var body: some View{
        ZStack{
            Image("level1_1")
            Image("level1_\(idx)")
                .animation(.easeInOut(duration: 2))
                .onReceive(timer) { _ in
                    withAnimation{
                        self.idx = self.idx < 7 ? self.idx + 1 : 0
                    }
                }
        }
    }
}
