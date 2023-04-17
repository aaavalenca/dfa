// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct LevelTwoView : View {
    let level : Int = 1
    @Environment(\.presentationMode) var presentation
    @StateObject var viewModel = LevelViewModel()
    @State var bodies : [String] = ["👽", "🌒"]
    // for animating the rocket
    let timer = Timer.publish(every: 0.8, on: .main, in: .common)
    // current step for rocket animation
    @State var pos : Int = 0
    @State var popover : Bool = true
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
    @State var next : Bool = false
    
    @Binding var isActive : Bool
    
    var body : some View{
        ZStack{
            Color.purple.brightness(-0.8).ignoresSafeArea()
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                Route(level: viewModel.allLevels[level].level)
                    .overlay(
                        GeometryReader {geo in
                            // Level 1 only has one picker
                                MenuPicker(bodies: $bodies, selectedBody: $selectedBody1)
                                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                    .position(x: geo.size.width * viewModel.allLevels[level].pickerXPos[0], y: geo.size.height * viewModel.allLevels[level].pickerYPos[0])
                                MenuPicker(bodies: $bodies, selectedBody: $selectedBody2)
                                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                    .position(x: geo.size.width * viewModel.allLevels[level].pickerXPos[1], y: geo.size.height * viewModel.allLevels[level].pickerYPos[1])
                                MenuPicker(bodies: $bodies, selectedBody: $selectedBody3)
                                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                    .position(x: geo.size.width * viewModel.allLevels[level].pickerXPos[2], y: geo.size.height * viewModel.allLevels[level].pickerYPos[2])
                                MenuPicker(bodies: $bodies, selectedBody: $selectedBody4)
                                    .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                    .position(x: geo.size.width * viewModel.allLevels[level].pickerXPos[3], y: geo.size.height * viewModel.allLevels[level].pickerYPos[3])
                            
                            //finishline
                            Text("🏁")
                                .font(.system(size: geo.size.width * 0.15))
                                .rotation3DEffect(.degrees(viewModel.allLevels[level].finishAngle), axis: (x: 0, y: 0, z: 1))
                                .position(x: geo.size.width * viewModel.allLevels[level].finishX, y: geo.size.height * viewModel.allLevels[level].finishY)
                            
                            // Rocket animation
                            Text("🚀")
                                .font(.system(size: geo.size.width * 0.22))
                                .rotationEffect(Angle(degrees: viewModel.allLevels[level].angles[pos]))
                                .position(x: geo.size.width * (viewModel.allLevels[level].xPos[pos]), y: geo.size.height * (viewModel.allLevels[level].yPos[pos]))
                                .animation(.linear(duration: 0.8), value: pos)
                        }.onReceive(timer, perform: { _ in
                            if pos < viewModel.allLevels[level].xPos.count - 1 && won{
                                pos = pos + 1
                            } else {
                                timer.connect().cancel()
                            }
                        })
                    )
                    .padding()
                // Continue to next stage. It's only able to tap when winning condition is met
                HStack{
                    
                    NavigationLink(destination: LevelThreeView(isActive: $isActive), isActive: $next) { EmptyView()}
                    
                    Button("CONTINUE", action: {
                        next.toggle()
                    })
                    .buttonStyle(CustomButton(myColor: Color(red: 13/255, green: 0, blue: 160/255) , myColor2: Color(red: 1/255, green: 197/255, blue: 32/255)))
                    .disabled(!won)
                    .onChange(of: [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]) { _ in
                        selectedBodies = [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]
                        //winning condition
                        if (selectedBodies == viewModel.allLevels[level].answer) || (selectedBodies == viewModel.allLevels[level].answer2)  {
                            timer.connect()
                            won.toggle()
                        } else {
                            won = false
                        }
                    }
                    
                    Button("MISSION"){
                        popover = true
                    }
                    .buttonStyle(CustomButton(myColor: Color(red: 190/255, green: 0, blue: 0) , myColor2: Color(red: 187/255, green: 191/255, blue: 0)))
                    
                    
                    Button("BACK"){
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(CustomButton(myColor: Color(red: 30/255, green: 0, blue: 148/255), myColor2: Color(red: 134/255, green: 0, blue: 0)))
                    
                }.padding()
                    .padding(.bottom, 60)
            }.onAppear {
                self.selectedBodies.append(selectedBody1)
                self.selectedBodies.append(selectedBody2)
                self.selectedBodies.append(selectedBody3)
                self.selectedBodies.append(selectedBody4)
                self.selectedBodies.append(selectedBody5)
                self.selectedBodies.append(selectedBody6)
            }
            
            if popover {
                MissionView(objective: viewModel.allLevels[level].objective, close: $popover)
                    .animation(.spring())
                    .transition(.move(edge: .top))
            }
        }.navigationBarBackButtonHidden(true)
    }
}

//struct LevelTwoView_Previews: PreviewProvider {
//    static var previews: some View {
//        LevelTwoView()
//    }
//}
