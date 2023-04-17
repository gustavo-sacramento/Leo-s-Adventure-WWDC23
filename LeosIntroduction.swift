//
//  NextView.swift
//  WWDC23
//
//  Created by Gustavo Sacramento on 10/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct LeosIntroduction: View {
    @State var pageNum = 0
    @State var leoFaces = ["leo_smiling", "leo_smiling", "leo_surprised", "leo_sad", "leo_happy"]
    @State var texts = [Text("""
         I'm a boy from Brazil. I know we just
         met, but I really need your help. Can I
         count on you for a quick adventure?
        """), Text("""
        First, let me tell you a bit about
        \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))). Many people believe this
        rhythm was created in Rio de janeiro,
        but it began in fact in Bahia, a state in
        the north-east of Brazil, exactly
        where I'm from!
        """),
        Text("""
        \(Text("'samba-de-roda '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))), as it is known
        originally, is the result of the fusion
        between Brazilian culture and African
        culture. It emerged from the enslaved
        Africans' religious gatherings, with
        an emphasis on drumming and dance.
        """),
        Text("""
        Because of slavery, there was a lot
        of discrimination against \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))),
        to the point where it was prohibited.
        Therefore, \(Text("samba").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114))) has always been a
        mechanism of preservation of the
        legacy of enslaved people in Brazil.
        """),
        Text("""
        HERE's where you come in! Obviously,
        I'm just a talking head, so I need your
        help to collect some instruments so
        we can play some \(Text("'samba-de-roda '").foregroundColor(Color(red: 0.961, green: 0.506, blue: 0.114)))!
        Let's see where we can find them on
        the map.
        """)
                        ]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("clouds")
                    .resizable()
                    .frame(width: responsiveX(1366), height: responsiveY(950))
                    .offset(y: responsiveY(-50))
                    .ignoresSafeArea()
                
                if pageNum == 4 {
                    NavigationLink(destination: MapView()) {
                        ZStack {
                            Image("button_background2")
                                .resizable()
                                .frame(width: responsiveX(650), height: responsiveY(220))
                                .offset(x: responsiveX(-20))
                            
                            Text("Let's go!")
                                .font(.custom("Bonoco", size: responsiveX(130)))
                                .frame(width: responsiveX(600), height: responsiveY(206))
                                .foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))
                        }
                    }
                    .offset(x: responsiveX(270), y: responsiveY(220))
                }
                
                VStack {
                    if pageNum == 0 {
                        Text("Hi, Im ").font(.custom("Bonoco", size: responsiveX(60))).foregroundColor(Color(red: 38/255, green: 41/255, blue: 63/255)) + Text("LEO").font(.custom("Bonoco", size: responsiveX(60))).foregroundColor(Color(red: 0.486, green: 0.659, blue: 0.29)) + Text("!!").font(.custom("Bonoco", size: responsiveX(60))).foregroundColor(Color(red: 38/255, green: 41/255, blue: 63/255))
                        
                    } else if pageNum == 1 {
                        Text("Awesome!")
                            .font(.custom("Bonoco", size: responsiveX(60)))
                            .frame(width: responsiveX(730), height: responsiveY(40))
                            .foregroundColor(Color(red: 38/255, green: 41/255, blue: 63/255))
                            .multilineTextAlignment(.center)
                    }

                    
                    Text("\(texts[pageNum])")
                    .font(.custom("Bonoco", size: responsiveX(40)))
                    .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
                }
                .padding(responsiveX(40))
                .background(.white)
                .cornerRadius(responsiveX(30))
                .shadow(radius: 5)
                .offset(x: responsiveX(180), y: responsiveY(-250))
                
                Image("\(leoFaces[pageNum])")
                    .resizable()
                    .frame(width: responsiveX(571), height: responsiveY(695))
                    .offset(x: responsiveX(-390), y: responsiveY(180))
                
                Button {
                    if pageNum < 4 {
                        pageNum += 1
                    }
                    print(pageNum)
                } label: {
                    ZStack {
                        if pageNum == 0 {
                            Image("button_background1")
                                .resizable()
                                .frame(width: responsiveX(490), height: responsiveY(220))
                                .offset(x: responsiveX(-19))
                            
                            Text("sure!")
                                .font(.custom("Bonoco", size: responsiveX(130)))
                                .frame(width: responsiveX(414), height: responsiveY(206))
                                .foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))
                        } else if pageNum < 4 {
                            Image("button_background4")
                                .resizable()
                                .frame(width: responsiveX(490), height: responsiveY(220))
                            
                            Text("next")
                                .font(.custom("Bonoco", size: responsiveX(140)))
//                                .frame(width: getWidth(414), height: getHeight(206))
                                .foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))
                                .offset(y: responsiveY(-10))
                        }
                    }
                }
                .offset(x: responsiveX(270), y: responsiveY(220))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 162/255, green: 220/255, blue: 248/255))
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 16.0, *)
struct LeosInstroduction_Previews: PreviewProvider {
    static var previews: some View {
        LeosIntroduction().previewInterfaceOrientation(.landscapeRight)
    }
}
