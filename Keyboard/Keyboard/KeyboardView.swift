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
        HStack {
            GeometryReader { geometry in
                HStack(spacing: KeyboardView.spacing) {
                    KeyboardAlphabetView()
                        .frame(width: viewWidth(geometry, buttonCount: KeyboardAlphabetViewModelImp.firstRowCount))
                    KeyboardNumericView()
                        .frame(width: viewWidth(geometry, buttonCount: KeyboardNumericViewModelImp.firstRowCount))
                    KeyboardActionView()
                        .frame(width: viewWidth(geometry, buttonCount: KeyboardActionViewModelImp.firstRowCount))
                }
                .frame(height: viewHeight(geometry))
                .offset(y: geometry.size.height - viewHeight(geometry))
            }
        }
    }

    private var totalCount: Int {
        let alphabetCount = KeyboardAlphabetViewModelImp.firstRowCount
        let numericCount = KeyboardNumericViewModelImp.firstRowCount
        let actionCount = KeyboardActionViewModelImp.firstRowCount
        return alphabetCount + numericCount + actionCount
    }
    
    private func viewWidth(_ geometry: GeometryProxy, buttonCount: Int) -> CGFloat {
        let fraction = CGFloat(buttonCount) / CGFloat(totalCount)
        return geometry.size.width * fraction
    }
    
    private func viewHeight(_ geometry: GeometryProxy) -> CGFloat {
        let width = geometry.size.width / CGFloat(totalCount)
        return CGFloat(KeyboardAlphabetViewModelImp.alphabetsGrid.count) * width
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
