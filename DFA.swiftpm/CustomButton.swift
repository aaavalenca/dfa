// ORIENTATION MODE OF THE APP IS PORTRAIT

import Foundation
import SwiftUI

// button customization
struct CustomButton : ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    var myColor : Color
    var myColor2 : Color
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 80, maxWidth: 150, minHeight: 40, maxHeight: 80)
            .background(
                isEnabled
                ?
                LinearGradient(gradient: Gradient(colors: [myColor, myColor2]),
                               startPoint: .leading, endPoint: .trailing)
                :
                    LinearGradient(gradient: Gradient(colors: [Color(red: 65/255, green: 65/255, blue: 65/255), .gray]),
                                startPoint: .leading, endPoint: .trailing)
            )
            .foregroundColor(.white)
            .cornerRadius(30)
            .padding(20)
            .controlSize(.large)
            .shadow(color: .black, radius: 50)
    }
}

