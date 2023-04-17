//
//  LiveLoopview.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 11/04/23.
//

import SwiftUI
import AVFAudio

@available(iOS 16.0, *)
struct LiveLoopView: View {
    @State var clapsIsOn = false
    @State var pandeiroIsOn = false
    @State var pratoIsOn = false
    @State var atabaqueIsOn = false
    @State var surdoIsOn = false
    @State var violaIsOn = false
    @State var soundIsOn = false
    
    @State var showText = true
    
    @State var violaAudioPlayer: AVAudioPlayer?
    @State var pandeiroAudioPlayer: AVAudioPlayer?
    @State var pratoAudioPlayer: AVAudioPlayer?
    @State var atabaqueAudioPlayer: AVAudioPlayer?
    @State var surdoAudioPlayer: AVAudioPlayer?
    @State var clapsAudioPlayer: AVAudioPlayer?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("live_loop_map")
                    .resizable()
                    .frame(width: responsiveX(1366), height: responsiveY(1024))
                    .ignoresSafeArea()
                
                Image("man")
                    .resizable()
                    .frame(width: responsiveX(269), height: responsiveY(394))
                    .offset(x: responsiveX(230), y: responsiveY(-180))
                
                Image("woman")
                    .resizable()
                    .frame(width: responsiveX(208), height: responsiveY(394))
                    .offset(x: responsiveX(-200), y: responsiveY(-180))
                
                if showText{
                    VStack {
                        Text("""
                            now its your turn to \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114)))! Tap any
                            instrument to toggle the sound.
                            """)
                        .font(.custom("Bonoco", size: responsiveX(55)))
                        .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
                    }
                    .padding(30)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    .offset(y: responsiveY(-250))
                } else {
                    NavigationLink(destination: ContentView()) {
                        ZStack {
                            Image("button_background1")
                                .resizable()
                            
                            Text("Play again")
                                .font(.custom("Bonoco", size: responsiveX(70)))
                                .foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))
                        }
                        .frame(width: responsiveX(450), height: responsiveY(150))
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        violaAudioPlayer?.stop()
                        pandeiroAudioPlayer?.stop()
                        clapsAudioPlayer?.stop()
                        pratoAudioPlayer?.stop()
                        atabaqueAudioPlayer?.stop()
                        surdoAudioPlayer?.stop()
                    })
                    .offset(x: responsiveX(-440), y: responsiveY(-410))
                }
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Toggle("", isOn: $violaIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "viola_button", player: $violaAudioPlayer, factor: 0.3, showText: $showText))
           
                        Spacer()
                        
                        Toggle("", isOn: $clapsIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "clap_button", player: $clapsAudioPlayer, factor: 0.5, showText: $showText))
                        
                        Spacer()
                        
                        
                        Toggle("", isOn: $pratoIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "prato_button", player: $pratoAudioPlayer, factor: 0.1, showText: $showText))
                        
                        Spacer()
                    }
                    .offset(y: responsiveY(-10))
                    
                    HStack {
                        Spacer()
                        Toggle("", isOn: $pandeiroIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "pandeiro_button", player: $pandeiroAudioPlayer, factor: 1.0, showText: $showText))

        
                        Spacer()
                        
                        Toggle("", isOn: $atabaqueIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "atabaque_button", player: $atabaqueAudioPlayer, factor: 0.4, showText: $showText))

                        Spacer()
                        
                        Toggle("", isOn: $surdoIsOn)
                            .toggleStyle(CustomToggleStyle(instrumentButton: "surdo_button", player: $surdoAudioPlayer, factor: 1.0, showText: $showText))

                        Spacer()
                    }
                }
                .offset(y: responsiveY(270))
                
                Spacer()
                
                
            }
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                playSound("pandeiro.mp3", player: &pandeiroAudioPlayer)
                playSound("viola.mp3", player: &violaAudioPlayer)
                playSound("claps.mp3", player: &clapsAudioPlayer)
                playSound("surdo.mp3", player: &surdoAudioPlayer)
                playSound("atabaque.mp3", player: &atabaqueAudioPlayer)
                playSound("prato.mp3", player: &pratoAudioPlayer)
                
                let when = DispatchTime.now()
                
                if let pandeiroAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        pandeiroAudioPlayer.play()
                    }
                }
                  
                if let violaAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        violaAudioPlayer.play()
                    }
                }
                
                if let clapsAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        clapsAudioPlayer.play()
                    }
                }
                
                if let surdoAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        surdoAudioPlayer.play()
                    }
                }
                
                if let atabaqueAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        atabaqueAudioPlayer.play()
                    }
                }
                
                if let pratoAudioPlayer {
                    DispatchQueue.main.asyncAfter(deadline: when + 0.1) {
                        pratoAudioPlayer.play()
                    }
                }
            })
        }
    }
    
    func playSound(_ soundFileName : String, player: inout AVAudioPlayer?) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) else {
            fatalError("Unable to find \(soundFileName) in bundle")
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL)
        } catch {
            print(error.localizedDescription)
        }
        
        if let player {
            player.setVolume(0, fadeDuration: 0)
            player.numberOfLoops = -1
            player.prepareToPlay()
        }
    }

    
    struct CustomToggleStyle: ToggleStyle {
        @State var instrumentButton: String
        @Binding var player: AVAudioPlayer?
        @State var factor: Float
        @Binding var showText: Bool
        
        func makeBody(configuration: Configuration) -> some View {
            VStack {
                Button(action: {
                    configuration.isOn.toggle()
                    showText = false
                    
                    if let player {
                        if configuration.isOn {
                            player.setVolume(1 * factor, fadeDuration: 0)
                        } else {
                            player.setVolume(0, fadeDuration: 0.1)
                        }
                    }
                }, label: {
                    if configuration.isOn {
                        Image(instrumentButton)
                            .resizable()
                            .frame(width: 324 * (UIScreen.main.bounds.width / 1366), height: 179 * (UIScreen.main.bounds.height / 1024))
                    } else {
                        Image("\(instrumentButton)_inactive")
                            .resizable()
                            .frame(width: 324 * (UIScreen.main.bounds.width / 1366), height: 179 * (UIScreen.main.bounds.height / 1024))
                    }
                })
                .scaleEffect(configuration.isOn ? 1.1 : 1.0)
                .animation(.easeIn(duration: 0.2))
            }
        }
    }
}

@available(iOS 16.0, *)
struct LiveLoopView_Previews: PreviewProvider {
    static var previews: some View {
        LiveLoopView().previewInterfaceOrientation(.landscapeRight)
    }
}
