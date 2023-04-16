import Foundation
import SwiftUI

struct Level : View {
    @EnvironmentObject var global : Global
    var levelModel : LevelModel
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
    @State var unlocked : Bool = true
    
    var body : some View{
        VStack{
            Route(level: levelModel.level)
                .overlay(
                    GeometryReader {geo in
                                            
                        // Pickers
                        // Level 1 only has one picker
                        if unlocked{
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody1)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[0], y: geo.size.height * levelModel.pickerYPos[0])
                        }
                        // Levels 2 and 3 have four pickers
                        if global.levelNum > 1 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody2)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[1], y: geo.size.height * levelModel.pickerYPos[1])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody3)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[2], y: geo.size.height * levelModel.pickerYPos[2])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody4)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[3], y: geo.size.height * levelModel.pickerYPos[3])
                        }
                        // Levels 4 and 5 have six pickers
                        if global.levelNum > 3 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody5)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[4], y: geo.size.height * levelModel.pickerYPos[4])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody6)
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[5], y: geo.size.height * levelModel.pickerYPos[5])
                        }
                        
                        //finishline
                        Text("🏁")
                            .font(.system(size: geo.size.width * 0.15))
                            .rotation3DEffect(.degrees(levelModel.finishAngle), axis: (x: 0, y: 0, z: 1))
                            .position(x: geo.size.width * levelModel.finishX, y: geo.size.height * levelModel.finishY)
                        
                        // Rocket animation
                            Text("🚀")
                            .font(.system(size: geo.size.width * 0.22))
                            .rotationEffect(Angle(degrees: levelModel.angles[pos]))
                            .position(x: geo.size.width * (levelModel.xPos[pos]), y: geo.size.height * (levelModel.yPos[pos]))
                            .animation(.linear(duration: 0.8), value: pos)
                    }.onReceive(timer, perform: { _ in
                        if pos < levelModel.xPos.count - 1 && won{
                            pos = pos + 1
                        } else {
                            timer.connect().cancel()
                        }
                    })
                )
                .padding()
            // Continue to next stage. It's only able to tap when winning condition is met
            HStack{
                Button("CONTINUE", action: {
                    unlocked.toggle()
                    global.levelNum+=1
                })
                .buttonStyle(CustomButton(myColor: Color(red: 13/255, green: 0, blue: 160/255) , myColor2: Color(red: 1/255, green: 197/255, blue: 32/255)))
                .disabled(!won)
                .onChange(of: [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]) { _ in
                    selectedBodies = [selectedBody1, selectedBody2, selectedBody3, selectedBody4, selectedBody5, selectedBody6]
                    //winning condition
                    if (selectedBodies == levelModel.answer) || (selectedBodies == levelModel.answer2)  {
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
                    global.levelNum = 0
                }
                .buttonStyle(CustomButton(myColor: Color(red: 30/255, green: 0, blue: 148/255), myColor2: Color(red: 134/255, green: 0, blue: 0)))

                
            }.padding()
        }.onAppear {
            self.selectedBodies.append(selectedBody1)
            self.selectedBodies.append(selectedBody2)
            self.selectedBodies.append(selectedBody3)
            self.selectedBodies.append(selectedBody4)
            self.selectedBodies.append(selectedBody5)
            self.selectedBodies.append(selectedBody6)
        }
        
        if popover {
            SheetView(objective: levelModel.objective, close: $popover)
                .animation(.spring())
                .transition(.move(edge: .top))
        }
    }
}

struct MenuPicker : View {
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
                .font(.largeTitle)
                .frame(maxWidth: 50, maxHeight: 50)
                .padding(20)
                .background(.white)
                .cornerRadius(50)
                .shadow(color: .white, radius: 20)
        }
    }
}

struct Route : View {
    @State private var idx : Int = 0
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    var level : String
    var body: some View{
        // animation for space route arrows to move
        ZStack{
            Image(level + "0")
                .resizable()
                .scaledToFit()
            Image(level + "\(idx)")
                .resizable()
                .scaledToFit()
                .animation(.easeInOut(duration: 2))
                .onReceive(timer) { _ in
                    withAnimation{
                        self.idx = self.idx < 3 ? self.idx + 1 : 0
                    }
                }
        }
    }
}
