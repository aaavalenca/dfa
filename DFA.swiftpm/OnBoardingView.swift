// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct OnBoardingView: View{
    @Environment(\.presentationMode) var presentation
    @State var idx = 1
    
    var body: some View{
        
        ScrollView{
            VStack(alignment: .leading, spacing: 40) {
                
                Group{
                    
                    HStack{
                        Spacer()
                        Text("DETERMINISTIC FINITE AUTOMATA")
                            .font(.custom("Courier-Bold", size: 50))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        Text("WHAT ARE THOSE??")
                            .font(.custom("Courier-Bold", size: 40))
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                
                Group{
                    Text("Well, to put it bluntly, a DFA is a computational model. The simplest one, actually! It has several STATES and they change given a certain INPUT. States are usually represented by circles.")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    HStack{
                        Spacer()
                        Image("description1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.095)
                        Spacer()
                    }
                }
                
                Group{
                    Text("A state is where the machine is at currently. For a machine to keep going, it has to TRANSITION between them. To describe these transitions, we draw arrows coming in and out of the states.")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    HStack{
                        Spacer()
                        Image("description2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.34)
                        Spacer()
                    }
                }
                
                Group{
                    Text("But how do we jump between states? Well, we have to read a SYMBOL - a char in a string, for instance. The entire string would be the input, and the input is read one char at a time. The set of chars that a machine recognizes is what we call the ALPHABET.")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    HStack{
                        Spacer()
                        Image("description3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.43)
                        Spacer()
                    }
                }
                
                Group{
                    Text("The alphabet defines the amount of transitions each state has. Because of its deterministic nature, a DFA _has_ to do something given a certain input. It can't just lie there. So, for each state, we'll have arrows coming out of it the same amount as the number of chars an alphabet contains.")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    HStack{
                        Spacer()
                        Image("description4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.77)
                        Spacer()
                    }
                }
                
                Group {
                    Text("Every DFA has one STARTING state (with a rogue arrow pointing at it) and one FINISHING state (a circle within a circle). It can have only one begining, but as many ends as you'd like, including its starting point.")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    HStack{
                        Spacer()
                        
                        Image("description5")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.3)
                    Spacer()
                    }
                }
                
                Group{
                    Text("How about we take a look a Deterministic Finite Automata working for a bit? Press => to go about a machine with alphabet [a, b] that recognizes strings that end in \"b\". Our example string is \"abba\".")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                    
                    Group{
                        VStack{
                            HStack{
                                Spacer()
                                
                                Image("example\(idx)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width * 0.78)
                             Spacer()
                            }
                            Button {
                                self.idx = self.idx < 5 ? self.idx + 1 : 1
                            } label: {
                                Text("==>")
                                    .font(.custom("Courier-Bold", size: 30))
                                    .background(.green)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                }
                
                Group{
                    Text("See? It landed on a finishing state, so our string was accepted! But if the automata reads the entire input and ends up on a non-finishing state, well... it breaks. That means that the machine doesn't recognize the input. As you can see, it can get quite messy. But to finish our quest, we'll have to get our hands dirty and plan space routes that look very similar to DFAs. Buckle up!")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                }
                
                Group{
                    Text("As you can see, it can get quite messy. But to finish our quest, we'll have to get our hands dirty and plan space routes that look very similar to DFAs. Buckle up!")
                        .font(.custom("Courier-Bold", size: 30))
                        .foregroundColor(.green)
                        .multilineTextAlignment(.leading)
                }
                
                HStack{
                    Spacer()
                    
                    Button {
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("<==== BACK")
                            .font(.custom("Courier-Bold", size: 30))
                            .background(.green)
                            .foregroundColor(.black)
                    }
                    Spacer()
                }
                
            }.padding(40)
        }
        .navigationBarBackButtonHidden(true)
        .background(.black)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
