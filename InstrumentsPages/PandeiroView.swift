//
//  pandeiroView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

struct PandeiroView: View {
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
                        .frame(width: getWidth(227), height: getHeight(107))
                        .offset(x: getWidth(-30))
                    
                    Text("Back")
                        .font(.custom("Bonoco", size: getFontSize(35)))
                        .foregroundColor(Color(red: 0.824, green: 0.424, blue: 0.322))
                }
            }
            .offset(x: getWidth(-500), y: getHeight(-400))
            
            Text("""
            This is the \(Text("'pandeiro '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114)))! It's a small hand
            drum with cymbals around the edges that make
            a shaking sound when it is hit. Tap to hear
            the sound!
            """)
            .font(.custom("Bonoco", size: getFontSize(40)))
            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
            .padding(30)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .offset(x: getWidth(140), y: getHeight(-280))
            
            Image("leo_looking_left")
                .resizable()
                .frame(width: getWidth(571), height: getHeight(695))
                .offset(x: getWidth(390), y: getHeight(150))
            
            Button {
                if let audioPlayer {
                    if !audioPlayer.isPlaying {
                        playSound("pandeiro_preview.mp3")
                    }
                } else {
                    playSound("pandeiro_preview.mp3")
                }
            } label: {
                ZStack {
                    Image("circular_background2")
                        .resizable()
                        .frame(width: getWidth(505), height: getHeight(458))

                    Image("pandeiro")
                        .resizable()
                        .frame(width: getWidth(353), height: getHeight(211))
                }
            }
            .offset(x: getWidth(-330), y: getHeight(180))

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.50, green: 0.40, blue: 0.7))
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
            audioPlayer.play()
        }
    }
}

struct PandeiroView_Previews: PreviewProvider {
    static var previews: some View {
        PandeiroView().previewInterfaceOrientation(.landscapeRight)
    }
}
