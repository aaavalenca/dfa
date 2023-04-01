import SwiftUI

@main
struct MyApp: App {
    let global = Global()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(global)
        }
    }
}
