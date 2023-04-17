//
//  surdoView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

struct SurdoView: View {
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
            this is the \(Text("'surdo '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))). It's a low drum responsible
            for the strong pulsating beat of \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))). It is
            my favorite drum because of the deep sound.
            Tap to hear it!
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
                        playSound("surdo_preview.mp3")
                    }
                } else {
                    playSound("surdo_preview.mp3")
                }
            } label: {
                ZStack {
                    Image("circular_background6")
                        .resizable()
                        .frame(width: responsiveX(505), height: responsiveY(458))

                    Image("surdo")
                        .resizable()
                        .frame(width: responsiveX(220), height: responsiveY(284))
                }
            }
            .offset(x: responsiveX(360), y: responsiveY(180))

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.721, green: 0.255, blue: 0.403))
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

struct SurdoView_Previews: PreviewProvider {
    static var previews: some View {
        SurdoView().previewInterfaceOrientation(.landscapeRight)
    }
}
