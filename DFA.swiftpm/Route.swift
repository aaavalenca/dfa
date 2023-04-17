//
//  Route.swift
//  DFA
//
//  Created by aaav on 16/04/23.
//

import SwiftUI

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
//                .animation(.easeInOut(duration: 2))
                .onReceive(timer) { _ in
                    withAnimation(Animation.easeInOut(duration: 2)){
                        self.idx = self.idx < 3 ? self.idx + 1 : 0
                    }
                }
        }
    }
}
