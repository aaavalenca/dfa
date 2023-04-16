//
//  MissionView.swift
//  DFA
//
//  Created by aaav on 15/04/23.
//

import SwiftUI

struct MissionView: View {
    @State var showSheet: Bool = true
    var levelViewModel : LevelViewModel = LevelViewModel()
    var body: some View {
        ZStack {
            Text("Hello, World!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    showSheet.toggle()
                }
                
            if showSheet {
                SheetView(objective: levelViewModel.allLevels[0].objective, close: $showSheet)
                    .animation(.spring())
                    .transition(.move(edge: .top))
//                    .transition(.move(edge: .bottom))
            }
        }
    }
}


struct SheetView : View {
    
    let objective : String
    @Binding var close : Bool
    
    var body: some View {
        VStack{
            Text("MISSION:\n\n==================>\n" + objective + "\n<==================\n\n* Starting point: 🏁 *\n* Finishing point: 🚀 *")
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .padding(40)
                .font(.custom("Courier-Bold", size: 30))
//                .font(.system(size: 400))
                .minimumScaleFactor(0.005)

            Button("CLOSE"){
                close.toggle()
            }
            .buttonStyle(CustomButton(myColor: .red))
            .padding(40)
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.width * 0.5)
        .background(Color.black)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 40)
        )
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView()
    }
}
