//
//  KeyboardAlphabetView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardAlphabetView: View {
    
    @StateObject private var vm = KeyboardAlphabetViewModelImp()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: KeyboardView.spacing) {
                ForEach(vm.alphabetsGrid.indices) { index in
                    HStack(spacing: KeyboardView.spacing) {
                        ForEach(vm.alphabetsGrid[index], id: \.self) { alphabet in
                                Button {
                                    print("handle action of \(alphabet)")
                                } label: {
                                    Text(alphabet.rawValue)
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
        let count = vm.alphabetsGrid.first?.count ?? 1
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.width - totalGaps) / CGFloat(count)
    }
    
    private func spaceWidth(_ geometry: GeometryProxy) -> CGFloat {
        let count = vm.alphabetsGrid.last?.count ?? 1
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        let totalWidth = width(geometry) * CGFloat(count - 1)
        return geometry.size.width - totalGaps - totalWidth
    }
    
    private func height(_ geometry: GeometryProxy) -> CGFloat {
        let count = vm.alphabetsGrid.count
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
