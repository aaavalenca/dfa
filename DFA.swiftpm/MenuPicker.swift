//
//  MenuPicker.swift
//  DFA
//
//  Created by aaav on 16/04/23.
//

import SwiftUI

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
