//
//  pratoView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

struct PratoView: View {
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
            this one I am sure you have at home: the
            \(Text("'prato e faca '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))), which means plate and knife.
            this is played by scratching the knife
            on the back of the plate. Tap to hear its
            unique sound!
            """)
            .font(.custom("Bonoco", size: responsiveX(40)))
            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
            .padding(30)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .offset(x: responsiveX(150), y: responsiveY(-280))
            
            Image("leo_starry_eyed")
                .resizable()
                .frame(width: responsiveX(571), height: responsiveY(695))
                .offset(x: responsiveX(-390), y: responsiveY(150))
            
            Button {
                if let audioPlayer {
                    if !audioPlayer.isPlaying {
                        playSound("prato.mp3")
                    }
                } else {
                    playSound("prato.mp3")
                }
            } label: {
                ZStack {
                    Image("circular_background4")
                        .resizable()
                        .frame(width: responsiveX(505), height: responsiveY(458))
                        .offset(x: responsiveX(-20))

                    Image("prato")
                        .resizable()
                        .frame(width: responsiveX(361), height: responsiveY(292))
                }
            }
            .offset(x: responsiveX(360), y: responsiveY(180))

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.635, green: 0.863, blue: 0.973))
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

struct PratoView_Previews: PreviewProvider {
    static var previews: some View {
        PratoView().previewInterfaceOrientation(.landscapeRight)
    }
}
