// ORIENTATION MODE OF THE APP IS PORTRAIT

import Foundation

class Global : ObservableObject{
    static let shared = Global()
    @Published var sound = true
}
