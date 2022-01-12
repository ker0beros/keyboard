//
//  LaunchScreen.swift
//  Keyboard
//
//  Created by Khairul Azmi on 12/01/2022.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        KeyboardView()
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
