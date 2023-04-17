import SwiftUI

@available(iOS 16.0, *)
@main
struct MyApp: App {
    init() {
        let cfURL = Bundle.main.url(forResource: "Bonoco",  withExtension: "ttf")!
        CTFontManagerRegisterFontsForURL(cfURL as CFURL, CTFontManagerScope.process, nil)
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
