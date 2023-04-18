//
//  SwiftUIView.swift
//  Leo's Adventure
//
//  Created by Gustavo Sacramento on 18/04/23.
//

import SwiftUI

struct AboutMeView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Image("background_about_me")
                .resizable()
                .ignoresSafeArea()
            
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
            
            VStack {
                Text("Hi! My name is gustavo and I'm a computer engineering student from Salvador, Brazil. Since I was very young, i've always been fascinated by music and culture, especially the culture of my country.\n\nI designed this game to emphasize the importance of \(Text("samba de roda").foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))) for Brazilian culture and it's people, as well as an opportunity for children to have fun playing with music.\n\nAs of 2008, \(Text("Samba de Roda").foregroundColor(Color(red: 0.741, green: 0.224, blue: 0.388))) of the Reconcavo of Bahia has been inscribed on the Representative List of the Intangible Cultural Heritage of Humanity by UNesco.")
                    .font(.custom("Bonoco", size: 30))
                    .foregroundColor(Color(red: 0.15, green: 0.159, blue: 0.246))
            }
            .padding(30)
            .background(.white)
            .cornerRadius(30)
            .shadow(radius: 5)
            .frame(width: responsiveX(1305), height: responsiveY(469))
            .offset(y: responsiveY(220))
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView().previewInterfaceOrientation(.landscapeRight)
    }
}
