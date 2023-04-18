// DESIGNED FOR IPAD
// ORIENTATION MODE OF THE APP IS PORTRAIT

import SwiftUI

struct ContentView: View {

    @State var isEnabled = true
    @State var fadeout = false
    
    var body: some View {
        ZStack{
            WelcomeView()
            
            HStack{
                Spacer()
                if fadeout {
                    VStack{
                        Button {
                            Global.shared.sound.toggle()
                            isEnabled.toggle()
                            if Global.shared.sound {
                                Sounds.audioPlayerB?.play()
                            } else {
                                Sounds.audioPlayerB?.pause()
                            }
                            
                            
                        } label: {
                            isEnabled ?
                            Image(systemName: "speaker.wave.2.fill")
                                .frame(minWidth: 50, maxWidth: 70, minHeight: 50, maxHeight: 70)
                            :
                            Image(systemName: "speaker.slash.fill")
                                .frame(minWidth: 50, maxWidth: 70, minHeight: 50, maxHeight: 70)
                            
                        }
                        .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
                        .background(
                            isEnabled
                            ?
                            LinearGradient(gradient: Gradient(colors: [.green, .blue]),
                                           startPoint: .leading, endPoint: .trailing)
                            :
                                LinearGradient(gradient: Gradient(colors: [Color(red: 65/255, green: 65/255, blue: 65/255), .gray]),
                                               startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(20)
                        .controlSize(.large)
                        .shadow(color: .black, radius: 50)
                        
                        Spacer()
                    }
                }
            }
        }.onAppear(perform: {
            Sounds.playMusic(soundfile: "ambience.mp3")
            
            withAnimation(.easeInOut(duration: 1.0).delay(1)) {
                fadeout = true
            }
            
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
