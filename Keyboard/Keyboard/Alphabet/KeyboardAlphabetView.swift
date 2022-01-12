//
//  KeyboardAlphabetView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardAlphabetView: View {
    
    @StateObject private var vm = KeyboardAlphabetViewModelImp()
    
    var keyboardProtocol: KeyboardProtocol?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: KeyboardView.spacing) {
                ForEach(KeyboardAlphabetViewModelImp.alphabetsGrid.indices) { index in
                    HStack(spacing: KeyboardView.spacing) {
                        ForEach(KeyboardAlphabetViewModelImp.alphabetsGrid[index], id: \.self) { alphabet in
                                Button {
                                    if alphabet == .shift {
                                        vm.toggleCase()
                                    } else {
                                        keyboardProtocol?.character(vm.uppercase ? alphabet.rawValue.uppercased() : alphabet.rawValue.lowercased())
                                    }
                                } label: {
                                    Text(vm.uppercase ? alphabet.rawValue.uppercased() : alphabet.rawValue.lowercased())
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .frame(width: alphabet == .space ? spaceWidth(geometry) : width(geometry), height: height(geometry))
                                
                                .background(.green)
                        }
                    }
                }
            }
        }
    }
    
    private func width(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardAlphabetViewModelImp.firstRowCount
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.width - totalGaps) / CGFloat(count)
    }
    
    private func spaceWidth(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardAlphabetViewModelImp.lastRowCount
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        let totalWidth = width(geometry) * CGFloat(count - 1)
        return geometry.size.width - totalGaps - totalWidth
    }
    
    private func height(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardAlphabetViewModelImp.alphabetsGrid.count
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.height - totalGaps) / CGFloat(count)
    }
}

struct KeyboardAlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardAlphabetView()
            .previewInterfaceOrientation(.landscapeRight)
            .previewLayout(.sizeThatFits)
    }
}
