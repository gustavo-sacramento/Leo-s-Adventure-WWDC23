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
                    .frame(width: responsiveX(1366), height:
                        responsiveY(1024))
                    .ignoresSafeArea()
                
                if !surdoHasTapped {
                    NavigationLink(destination: SurdoView()) {
                        Image("surdo")
                            .resizable()
                            .frame(width: responsiveX(106), height: responsiveY(147))
                    }.simultaneousGesture(TapGesture().onEnded {
                        surdoHasTapped = true
                    })
                    .offset(x: responsiveX(530), y: responsiveY(-80))
                } else {
                    Image("surdo_check")
                        .resizable()
                        .frame(width: responsiveX(180), height: responsiveY(200))
                        .offset(x: responsiveX(530), y: responsiveY(-80))
                }
                
                
                if !violaHasTapped {
                    NavigationLink(destination: ViolaView()) {
                        Image("viola")
                            .resizable()
                            .frame(width: responsiveX(205), height: responsiveY(150))
                    }.simultaneousGesture(TapGesture().onEnded {
                        violaHasTapped = true
                    })
                    .offset(x: responsiveX(-100), y: responsiveY(250))
                } else {
                    Image("viola_check")
                        .resizable()
                        .frame(width: responsiveX(205), height: responsiveY(179))
                        .offset(x: responsiveX(-100), y: responsiveY(250))
                }
                
                if !pandeiroHasTapped {
                    NavigationLink(destination: PandeiroView()) {
                        Image("pandeiro")
                            .resizable()
                            .frame(width: responsiveX(178), height: responsiveY(102))
                    }.simultaneousGesture(TapGesture().onEnded {
                        pandeiroHasTapped = true
                    })
                    .offset(x: responsiveX(280), y: responsiveY(230))
                } else {
                    Image("pandeiro_check")
                        .resizable()
                        .frame(width: responsiveX(203), height: responsiveY(159))
                        .offset(x: responsiveX(280), y: responsiveY(230))
                }
                
                if !atabaqueHasTapped {
                    NavigationLink(destination: AtabaqueView()) {
                        Image("atabaque")
                            .resizable()
                            .frame(width: responsiveX(110), height: responsiveY(185))
                    }.simultaneousGesture(TapGesture().onEnded {
                        atabaqueHasTapped = true
                    })
                    .offset(x: responsiveX(300), y: responsiveY(-350))
                } else {
                    Image("atabaque_check")
                        .resizable()
                        .frame(width: responsiveX(211), height: responsiveY(209))
                        .offset(x: responsiveX(300), y: responsiveY(-350))
                }
                
                if !pratoHasTapped {
                    NavigationLink(destination: PratoView()) {
                        Image("prato")
                            .resizable()
                            .frame(width: responsiveX(203), height: responsiveY(159))
                    }.simultaneousGesture(TapGesture().onEnded {
                        pratoHasTapped = true
                    })
                    .offset(x: responsiveX(-430), y: responsiveY(-225))
                } else {
                    Image("prato_check")
                        .resizable()
                        .frame(width: responsiveX(203), height: responsiveY(182))
                        .offset(x: responsiveX(-430), y: responsiveY(-225))
                }
                
                if !clapsHasTapped {
                    NavigationLink(destination: ClapsView()) {
                        Image("claps")
                            .resizable()
                            .frame(width: responsiveX(175), height: responsiveY(165))
                    }.simultaneousGesture(TapGesture().onEnded {
                        clapsHasTapped = true
                    })
                    .offset(x: responsiveX(-500), y: responsiveY(200))
                } else {
                    Image("claps_check")
                        .resizable()
                        .frame(width: responsiveX(185), height: responsiveY(197))
                        .offset(x: responsiveX(-500), y: responsiveY(200))
                }
                
                if pandeiroHasTapped && violaHasTapped && atabaqueHasTapped && clapsHasTapped && pratoHasTapped && surdoHasTapped {
                    VStack {
                        Text("""
                             Well done! now that we have all
                             the instruments, lets see how
                             they sound all together!
                             """)
                            .font(.custom("Bonoco", size: responsiveX(50)))
                            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
                    }
                    .padding(responsiveX(30))
                    .background(.white)
                    .cornerRadius(responsiveX(30))
                    .shadow(radius: 5)
                    .offset(y: responsiveY(-300))
                    
                    Image("leo_smiling")
                        .resizable()
                        .frame(width: responsiveX(571), height: responsiveY(695))
                        .offset(x: responsiveX(-390), y: responsiveY(150))
                    
                    NavigationLink(destination: LiveLoopView()) {
                        ZStack {
                            Image("button_background3")
                                .resizable()
                                .frame(width: responsiveX(750), height: responsiveY(180))
                                .offset(x: responsiveX(-10), y: responsiveY(10))
                            
                            Text("Let`s play!!")
                                .font(.custom("Bonoco", size: responsiveX(120)))
                                .foregroundColor(Color(red: 0.721, green: 0.255, blue: 0.403))
                        }
                    }
                    .offset(x: responsiveX(300), y: responsiveY(150))

                } else {
                    VStack {
                        Text("try tapping on an instrument")
                            .font(.custom("Bonoco", size: responsiveX(40)))
                            .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
//                            
                    }
                    .padding(responsiveX(30))
                    .background(.white)
                    .cornerRadius(responsiveX(30))
                    .shadow(radius: 5)
                .offset(x: responsiveX(-280), y: responsiveY(-400))
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
