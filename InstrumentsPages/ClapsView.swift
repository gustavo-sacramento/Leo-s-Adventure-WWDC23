//
//  clapsView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

struct ClapsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isSoundOn = false
    
    var body: some View {
        ZStack {
            Button {
                dismiss()
            } label: {
                ZStack {
                    Image("back_button")
                        .resizable()
                        .frame(width: responsiveX(227), height: responsiveY(107))
                        .offset(x: responsiveX(-30))
                    
                    Text("Back")
                        .font(.custom("Bonoco", size: responsiveX(35)))
                        .foregroundColor(Color(red: 0.824, green: 0.424, blue: 0.322))
                }
            }
            .offset(x: responsiveX(-500), y: responsiveY(-400))
            
            Text("""
            Perhaps the oldest instrument ever: the
            human body. Clapping is responsible for
            keeping rhythm in \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))). Try tapping the
            hands to hear the sound!
            """)
            .font(.custom("Bonoco", size: responsiveX(40)))
            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
            .padding(30)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .offset(x: responsiveX(150), y: responsiveY(-300))
            
            Image("leo_starry_eyed")
                .resizable()
                .frame(width: responsiveX(571), height: responsiveY(695))
                .offset(x: responsiveX(390), y: responsiveY(150))
            
            Button {
                if let audioPlayer {
                    if !audioPlayer.isPlaying {
                        playSound("claps.mp3")
                    }
                } else {
                    playSound("claps.mp3")
                }
                
                isSoundOn.toggle()
            } label: {
                ZStack {
                    Image("circular_background")
                        .resizable()
                        .frame(width: responsiveX(505), height: responsiveY(458))
                        .offset(y: responsiveY(-20))
                    
                    Image("claps")
                        .resizable()
                        .frame(width: responsiveX(310), height: responsiveY(310))
                }
            }
            .offset(x: responsiveX(-330), y: responsiveY(200))
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.200, green: 0.500, blue: 0.500))
        .navigationBarBackButtonHidden(true)
    }
    
    func playSound(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        
        if let audioPlayer {
            audioPlayer.setVolume(0.6, fadeDuration: 0)
            audioPlayer.play()
        }
    }
}

struct ClapsView_Previews: PreviewProvider {
    static var previews: some View {
        ClapsView().previewInterfaceOrientation(.landscapeRight)
    }
}
