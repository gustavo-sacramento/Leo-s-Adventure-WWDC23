//
//  MapView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 10/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct MapView: View {
    @State var pandeiroHasTapped: Bool = false
    @State var violaHasTapped: Bool = false
    @State var atabaqueHasTapped: Bool = false
    @State var clapsHasTapped: Bool = false
    @State var pratoHasTapped: Bool = false
    @State var surdoHasTapped: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("map")
                    .resizable()
                    .frame(width: getWidth(1366), height:
                        getHeight(1024))
                    .ignoresSafeArea()
                
                if !surdoHasTapped {
                    NavigationLink(destination: SurdoView()) {
                        Image("surdo")
                            .resizable()
                            .frame(width: getWidth(106), height: getHeight(147))
                    }.simultaneousGesture(TapGesture().onEnded {
                        surdoHasTapped = true
                    })
                    .offset(x: getWidth(530), y: getHeight(-80))
                } else {
                    Image("surdo_check")
                        .resizable()
                        .frame(width: getWidth(180), height: getHeight(200))
                        .offset(x: getWidth(530), y: getHeight(-80))
                }
                
                
                if !violaHasTapped {
                    NavigationLink(destination: ViolaView()) {
                        Image("viola")
                            .resizable()
                            .frame(width: getWidth(205), height: getHeight(150))
                    }.simultaneousGesture(TapGesture().onEnded {
                        violaHasTapped = true
                    })
                    .offset(x: getWidth(-100), y: getHeight(250))
                } else {
                    Image("viola_check")
                        .resizable()
                        .frame(width: getWidth(205), height: getHeight(179))
                        .offset(x: getWidth(-100), y: getHeight(250))
                }
                
                if !pandeiroHasTapped {
                    NavigationLink(destination: PandeiroView()) {
                        Image("pandeiro")
                            .resizable()
                            .frame(width: getWidth(178), height: getHeight(102))
                    }.simultaneousGesture(TapGesture().onEnded {
                        pandeiroHasTapped = true
                    })
                    .offset(x: getWidth(280), y: getHeight(230))
                } else {
                    Image("pandeiro_check")
                        .resizable()
                        .frame(width: getWidth(203), height: getHeight(159))
                        .offset(x: getWidth(280), y: getHeight(230))
                }
                
                if !atabaqueHasTapped {
                    NavigationLink(destination: AtabaqueView()) {
                        Image("atabaque")
                            .resizable()
                            .frame(width: getWidth(110), height: getHeight(185))
                    }.simultaneousGesture(TapGesture().onEnded {
                        atabaqueHasTapped = true
                    })
                    .offset(x: getWidth(300), y: getHeight(-350))
                } else {
                    Image("atabaque_check")
                        .resizable()
                        .frame(width: getWidth(211), height: getHeight(209))
                        .offset(x: getWidth(300), y: getHeight(-350))
                }
                
                if !pratoHasTapped {
                    NavigationLink(destination: PratoView()) {
                        Image("prato")
                            .resizable()
                            .frame(width: getWidth(203), height: getHeight(159))
                    }.simultaneousGesture(TapGesture().onEnded {
                        pratoHasTapped = true
                    })
                    .offset(x: getWidth(-430), y: getHeight(-225))
                } else {
                    Image("prato_check")
                        .resizable()
                        .frame(width: getWidth(203), height: getHeight(182))
                        .offset(x: getWidth(-430), y: getHeight(-225))
                }
                
                if !clapsHasTapped {
                    NavigationLink(destination: ClapsView()) {
                        Image("claps")
                            .resizable()
                            .frame(width: getWidth(175), height: getHeight(165))
                    }.simultaneousGesture(TapGesture().onEnded {
                        clapsHasTapped = true
                    })
                    .offset(x: getWidth(-500), y: getHeight(200))
                } else {
                    Image("claps_check")
                        .resizable()
                        .frame(width: getWidth(185), height: getHeight(197))
                        .offset(x: getWidth(-500), y: getHeight(200))
                }
                
                if pandeiroHasTapped && violaHasTapped && atabaqueHasTapped && clapsHasTapped && pratoHasTapped && surdoHasTapped {
                    VStack {
                        Text("""
                             Well done! now that we have all
                             the instruments, lets see how
                             they sound all together!
                             """)
                            .font(.custom("Bonoco", size: getFontSize(50)))
                            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
                    }
                    .padding(getFontSize(30))
                    .background(.white)
                    .cornerRadius(getFontSize(30))
                    .shadow(radius: 5)
                    .offset(y: getHeight(-300))
                    
                    Image("leo_smiling")
                        .resizable()
                        .frame(width: getWidth(571), height: getHeight(695))
                        .offset(x: getWidth(-390), y: getHeight(150))
                    
                    NavigationLink(destination: LiveLoopView()) {
                        ZStack {
                            Image("button_background3")
                                .resizable()
                                .frame(width: getWidth(750), height: getHeight(180))
                                .offset(x: getWidth(-10), y: getHeight(10))
                            
                            Text("Let`s play!!")
                                .font(.custom("Bonoco", size: getFontSize(120)))
                                .foregroundColor(Color(red: 0.721, green: 0.255, blue: 0.403))
                        }
                    }
                    .offset(x: getWidth(300), y: getHeight(150))

                } else {
                    VStack {
                        Text("try tapping on an instrument")
                            .font(.custom("Bonoco", size: getFontSize(40)))
                            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
//                            
                    }
                    .padding(getFontSize(30))
                    .background(.white)
                    .cornerRadius(getFontSize(30))
                    .shadow(radius: 5)
                .offset(x: getWidth(-280), y: getHeight(-400))
                }
              
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 16.0, *)
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().previewInterfaceOrientation(.landscapeRight)
    }
}
