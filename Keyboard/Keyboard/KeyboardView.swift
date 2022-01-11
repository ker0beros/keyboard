//
//  ContentView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardView: View {
    
    static let spacing: CGFloat = 2
    static let cornerRadius: CGFloat = 6
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}
