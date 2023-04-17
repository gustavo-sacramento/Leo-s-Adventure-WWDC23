import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("clouds")
                    .resizable()
                    .frame(width: responsiveX(1366), height: responsiveY(950))
                    .offset(y: responsiveY(-50))
                    .ignoresSafeArea()

                
                Image("background")
                    .resizable()
                    .frame(width: responsiveX(1366), height: responsiveY(950))
                    .offset(y: responsiveY(35))
                    .ignoresSafeArea()
                    
                VStack {
                    Text("Leo's Adventure")
                        .font(.custom("Bonoco", size: responsiveX(140)))
                        .frame(width: responsiveX(1224), height: responsiveY(188))
                        .foregroundColor(Color(red: 40/255, green: 77/255, blue: 89/255))
                        .offset(y: responsiveY(30))
                    
                    Text("A journey through the roots of samba")
                        .font(.custom("Bonoco", size: responsiveX(70)))
                        .frame(width: responsiveX(900), height: responsiveY(255))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .offset(y: responsiveY(30))
                    
                    NavigationLink(destination: LeosIntroduction()) {
                        ZStack {
                            Image("button_background4")
                                .resizable()
                                .frame(width: responsiveX(550), height: responsiveY(200))
                            
                            Text("Begin")
                                .font(.custom("Bonoco", size: responsiveX(130)))
                                .frame(width: responsiveX(698), height: responsiveY(205))
                                .foregroundColor(Color(red: 189/255, green: 57/255, blue: 99/255))
                                .offset(y: responsiveY(-13))
                        }
                        .offset(y: responsiveY(30))
                    }
                    
                    HStack {
                        Image("headphones")
                            .resizable()
                            .frame(width: responsiveX(82), height: responsiveY(84))
                        
                        Text("""
                            Use Headphones for
                            the best experience
                            """)
                            .font(.custom("Bonoco", size: responsiveX(30)))
                            .foregroundColor(Color(red: 40/255, green: 77/255, blue: 89/255))
                            .multilineTextAlignment(.leading)
                            .offset(x: responsiveX(20))
                    }
                    .offset(x: responsiveX(-20), y: responsiveY(85))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 162/255, green: 220/255, blue: 248/255))
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 16.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeRight)
    }
}

extension View{
    func responsiveX(_ originalWidth: Int) -> CGFloat {
        return CGFloat(originalWidth) * (UIScreen.main.bounds.width / 1366)
    }
    
    func responsiveY(_ originalHeight: Int) -> CGFloat {
        return CGFloat(originalHeight) * (UIScreen.main.bounds.height / 1024)
    }
}
