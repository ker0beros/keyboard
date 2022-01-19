//
//  KeyboardButtonStyle.swift
//  Keyboard
//
//  Created by Khairul Azmi on 13/01/2022.
//

import SwiftUI

struct KeyboardButtonStyle: ButtonStyle {
    
    let isNumeric: Bool
    
    init(isNumeric: Bool = false) {
        self.isNumeric = isNumeric
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                configuration.isPressed
                ? isNumeric ? Colors.keyboardButton : Colors.keyboardButtonNumeric
                : isNumeric ? Colors.keyboardButtonNumeric : Colors.keyboardButton
            )
            .foregroundColor(
                configuration.isPressed
                ? isNumeric ? Colors.keyboardButtonForeground : Colors.keyboardButtonForegroundPressed
                : isNumeric ? Colors.keyboardButtonForegroundPressed : Colors.keyboardButtonForeground
            )
            .cornerRadius(KeyboardView.cornerRadius)
    }
}
