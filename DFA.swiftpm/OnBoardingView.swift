//
//  OnBoardingView.swift
//  DFA
//
//  Created by aaav on 16/04/23.
//

import SwiftUI

struct OnBoardingView: View{
    @Environment(\.presentationMode) var presentation

    var body: some View{
        ZStack{
            Color.black
                .ignoresSafeArea()
            ScrollView{
                VStack(alignment: .leading){
                    Text("DETERMINISTIC FINITE AUTOMATA")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("WHAT ARE THOSE??")
                        .font(.system(size: 40))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    
                    Text("Well, to put it bluntly, a DFA is a computational model. The simplest one, actually! It has several states and they change given a certain input.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("States are usually represented by circles. And to transition between states, the machine has to read a symbol. A char in a string, for instance. The entire string is the input. The set of chars that a machine recognizes is what we call the alphabet.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("The alphabet defines the amount of transitions each state has. Because a DFA is deterministic, that is, it has to do something given a certain input. It can't just lie there. So, for each state, we'll have arrows coming out of it the same amount as the number of char in an alphabet.")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Text("Every DFA has a starting point and an end point. If")
                        .font(.system(.largeTitle))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("<==== BACK")
                            .background(.green)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
