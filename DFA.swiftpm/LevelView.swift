//
//  LevelView.swift
//  DFA
//
//  Created by aaav on 01/04/23.
//

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
                        
                        //finishline
                        Text("🏁")
                            .font(.system(size: geo.size.width * 0.15))
                            .position(x: geo.size.width * levelModel.finishX, y: geo.size.height * levelModel.finishY)
                                            
                        // Pickers
                        // Level 1 only has one picker
                        if unlocked{
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody1)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[0], y: geo.size.height * levelModel.pickerYPos[0])
                        }
                        // Levels 2 and 3 have four pickers
                        if global.levelNum > 1 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody2)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[1], y: geo.size.height * levelModel.pickerYPos[1])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody3)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[2], y: geo.size.height * levelModel.pickerYPos[2])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody4)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[3], y: geo.size.height * levelModel.pickerYPos[3])
                        }
                        // Levels 4 and 5 have six pickers
                        if global.levelNum > 3 && unlocked {
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody5)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[4], y: geo.size.height * levelModel.pickerYPos[4])
                            MenuPicker(bodies: $bodies, selectedBody: $selectedBody6)
                                .menuStyle(BodyMenu())
                                .frame(width: geo.size.width * 0.2, height: geo.size.width * 0.2)
                                .position(x: geo.size.width * levelModel.pickerXPos[5], y: geo.size.height * levelModel.pickerYPos[5])
                        }
                        
                        // Rocket animation
                        Image("foguetin")
                            .resizable()
                            .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.1)
                            .scaledToFit()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
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
                .buttonStyle(CustomButton(myColor: .white)).padding()
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
                Button("WHAT WAS IT AGAIN?"){
                    popover.toggle()
                }.buttonStyle(CustomButton(myColor: .white))
            }.padding()
        }.onAppear {
            self.selectedBodies.append(selectedBody1)
            self.selectedBodies.append(selectedBody2)
            self.selectedBodies.append(selectedBody3)
            self.selectedBodies.append(selectedBody4)
            self.selectedBodies.append(selectedBody5)
            self.selectedBodies.append(selectedBody6)
        }
        .alert(isPresented: $popover){
            Alert(title: Text("🚀"), message: Text(levelModel.objective), dismissButton: .cancel(Text("GO!")))
        }
    }
}

struct ObjectiveView : View{
    let text : String
    @Environment(\.dismiss) var dismiss
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Image("foguetin")
                Text(text)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(30)
                Button("GO BACK"){
                    dismiss()
                }.buttonStyle(CustomButton(myColor: .white))
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
                .font(.title2)
        }
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
