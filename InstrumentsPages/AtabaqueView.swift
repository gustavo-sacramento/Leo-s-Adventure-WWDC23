//
//  atabaqueView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

struct AtabaqueView: View {
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
            This is the \(Text("'atabaque '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))). it is an African
            drum that is commonly used in afro-brazilian
            religious cerimonies. Tap to hear its sound!
            """)
            .font(.custom("Bonoco", size: getFontSize(40)))
            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
            .padding(30)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .offset(x: getWidth(150), y: getHeight(-300))
            
            Image("leo_smacking_lips")
                .resizable()
                .frame(width: getWidth(571), height: getHeight(695))
                .offset(x: getWidth(390), y: getHeight(150))
            
            Button {
                if let audioPlayer {
                    if !audioPlayer.isPlaying {
                        playSound("atabaque.mp3")
                    }
                } else {
                    playSound("atabaque.mp3")
                }
            } label: {
                ZStack {
                    Image("circular_background3")
                        .resizable()
                        .frame(width: getWidth(505), height: getHeight(458))

                    Image("atabaque")
                        .resizable()
                        .frame(width: getWidth(218), height: getHeight(357))
                }
            }
            .offset(x: getWidth(-330), y: getHeight(180))

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.973, green: 0.718, blue: 0.533))
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

struct AtabaqueView_Previews: PreviewProvider {
    static var previews: some View {
        AtabaqueView().previewInterfaceOrientation(.landscapeRight)
    }
}
