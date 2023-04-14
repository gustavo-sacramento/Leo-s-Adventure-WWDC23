import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("clouds")
                    .resizable()
                    .frame(width: getWidth(1366), height: getHeight(950))
                    .offset(y: getHeight(-50))
                    .ignoresSafeArea()

                
                Image("background")
                    .resizable()
                    .frame(width: getWidth(1366), height: getHeight(950))
                    .offset(y: getHeight(35))
                    .ignoresSafeArea()
                    
                VStack {
                    Text("Leo's Adventure")
                        .font(.custom("Bonoco", size: getFontSize(140)))
                        .frame(width: getWidth(1224), height: getHeight(188))
                        .foregroundColor(Color(red: 40/255, green: 77/255, blue: 89/255))
                        .offset(y: getHeight(30))
                    
                    Text("A journey through the roots of samba")
                        .font(.custom("Bonoco", size: getFontSize(70)))
                        .frame(width: getWidth(900), height: getHeight(255))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .offset(y: getHeight(30))
                    
                    NavigationLink(destination: LeosIntroduction()) {
                        ZStack {
                            Image("button_background4")
                                .resizable()
                                .frame(width: getWidth(550), height: getHeight(200))
                            
                            Text("Begin")
                                .font(.custom("Bonoco", size: getFontSize(130)))
                                .frame(width: getWidth(698), height: getHeight(205))
                                .foregroundColor(Color(red: 189/255, green: 57/255, blue: 99/255))
                                .offset(y: getHeight(-13))
                        }
                        .offset(y: getHeight(30))
                    }
                    
                    HStack {
                        Image("headphones")
                            .resizable()
                            .frame(width: getWidth(82), height: getHeight(84))
                        
                        Text("""
                            Use Headphones for
                            the best experience
                            """)
                            .font(.custom("Bonoco", size: getFontSize(30)))
                            .foregroundColor(Color(red: 40/255, green: 77/255, blue: 89/255))
                            .multilineTextAlignment(.leading)
                            .offset(x: getWidth(20))
                    }
                    .offset(x: getWidth(-20), y: getHeight(85))
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
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getWidth(_ originalWidth: Int) -> CGFloat {
        return CGFloat(originalWidth) * (UIScreen.main.bounds.width / 1366)
    }
    
    func getHeight(_ originalHeight: Int) -> CGFloat {
        return CGFloat(originalHeight) * (UIScreen.main.bounds.height / 1024)
    }
    
    func getFontSize(_ originalSize: Int) -> CGFloat {
        return CGFloat(originalSize) * ((UIScreen.main.bounds.height / 1024))
    }
}
