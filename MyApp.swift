import SwiftUI

@available(iOS 16.0, *)
@main
struct MyApp: App {
    init() {
        let cfURL1 = Bundle.main.url(forResource: "Brasilero2018Free",  withExtension: "otf")!
        CTFontManagerRegisterFontsForURL(cfURL1 as CFURL, CTFontManagerScope.process, nil)
        
        let cfURL2 = Bundle.main.url(forResource: "Bareona",  withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)
        
        let cfURL3 = Bundle.main.url(forResource: "Asteristico",  withExtension: "otf")!
        CTFontManagerRegisterFontsForURL(cfURL3 as CFURL, CTFontManagerScope.process, nil)
        
        let cfURL4 = Bundle.main.url(forResource: "Bonoco",  withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(cfURL4 as CFURL, CTFontManagerScope.process, nil)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
