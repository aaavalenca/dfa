//
//  OnBoardingView.swift
//  DFA
//
//  Created by aaav on 16/04/23.
//

import SwiftUI

struct OnBoardingView: View{
    @Environment(\.presentationMode) var presentation
    @State var idx = 1
    
    var body: some View{
        ZStack{
            Color.black.ignoresSafeArea()
            
            ScrollView{
                
                VStack{
                    Text("DETERMINISTIC FINITE AUTOMATA")
                        .font(.custom("Courier-Bold", size: 50))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                    
                    Text("WHAT ARE THOSE??")
                        .font(.custom("Courier-Bold", size: 40))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                    
                }.padding(.top, 30)
                
                VStack(alignment: .leading){
                    Group{
                        Text("Well, to put it bluntly, a DFA is a computational model. The simplest one, actually! It has several STATES and they change given a certain INPUT. States are usually represented by circles.")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Image("description1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 98)
                            Spacer()
                        }.padding(.vertical, 20)
                    }
                    
                    Group{
                        Text("A state is where the machine is at currently. For a machine to keep going, it has to TRANSITION between them. To describe these transitions, we draw arrows coming in and out of the states.")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Image("description2")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 348)
                            Spacer()
                        }.padding(.vertical, 20)
                    }
                    
                    Group{
                        Text("But how do we jump between states? Well, we have to read a SYMBOL - a char in a string, for instance. The entire string would be the input, and the input is read one char at a time. The set of chars that a machine recognizes is what we call the ALPHABET.")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Image("description3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 442)
                            Spacer()
                        }.padding(.vertical, 20)
                    }
                    
                    Group{
                        Text("The alphabet defines the amount of transitions each state has. Because of its deterministic nature, a DFA _has_ to do something given a certain input. It can't just lie there. So, for each state, we'll have arrows coming out of it the same amount as the number of chars an alphabet contains.")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Image("description4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 749)
                            Spacer()
                        }.padding(.vertical, 20)
                    }
                    
                    Group {
                        Text("Every DFA has one STARTING state (with a rogue arrow pointing at it) and one FINISHING state (a circle within a circle). It can have only one begining, but as many ends as you'd like, including its starting point.")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Image("description5")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 314)
                            Spacer()
                        }.padding(.vertical, 20)
                    }
                    
                    Group{
                        Text("How about we take a look a Deterministic Finite Automata working for a bit? Press => to go about a machine with alphabet [a, b] that recognizes strings that end in \"b\". Our example string is \"abba\".")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            VStack{
                                Image("example\(idx)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 800)
                                
                                Button {
                                    self.idx = self.idx < 5 ? self.idx + 1 : 1
                                    print(self.idx)
                                } label: {
                                    Text("==>")
                                        .font(.custom("Courier-Bold", size: 30))
                                        .background(.green)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            Spacer()

                        }
                        
                    }
                    
                    Group{
                        Text("See? It landed on a finishing state, so our string was accepted! But if the automata reads the entire input and ends up on a non-finishing state, well... it breaks. That means that the machine doesn't recognize the input. As you can see, it can get quite messy. But to finish our quest, we'll have to get our hands dirty and plan space routes that look very similar to DFAs. Buckle up!")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
        
                        Text("As you can see, it can get quite messy. But to finish our quest, we'll have to get our hands dirty and plan space routes that look very similar to DFAs. Buckle up!")
                            .font(.custom("Courier-Bold", size: 30))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(10)
                            .padding(.vertical)
                    }
                    
                }.padding(40)
                
                VStack{
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("<==== BACK")
                            .font(.custom("Courier-Bold", size: 30))
                            .background(.green)
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.bottom, 100)


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
