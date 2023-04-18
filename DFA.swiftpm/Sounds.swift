// ORIENTATION MODE OF THE APP IS PORTRAIT

import AVFoundation

 class Sounds {

   static var audioPlayerA:AVAudioPlayer?
   static var audioPlayerB:AVAudioPlayer?

   static func playSounds(soundfile: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{
               audioPlayerA = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayerA?.prepareToPlay()
               
               audioPlayerA?.play()

           }catch {
               print("No sound")
           }
       }
    }
     
   static func playMusic(soundfile: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{
               audioPlayerB = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayerB?.prepareToPlay()
               audioPlayerB?.play()
               audioPlayerB?.numberOfLoops = -1

           }catch {
               print("No sound")
           }
       }
    }
 }
