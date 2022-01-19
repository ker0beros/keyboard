//
//  KeyboardNumericView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardNumericView: View {
        
    var keyboardProtocol: KeyboardProtocol?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: KeyboardView.spacing) {
                ForEach(KeyboardNumericViewModelImp.numericGrid.indices) { index in
                    HStack(spacing: KeyboardView.spacing) {
                        ForEach(KeyboardNumericViewModelImp.numericGrid[index], id: \.self) { numeric in
                                Button {
                                    keyboardProtocol?.character(numeric.rawValue)
                                } label: {
                                    Text(numeric.rawValue) // TODO use custom font
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                .frame(width: numeric == .zero ? zeroWidth(geometry) : width(geometry), height: height(geometry))
                                .background(.yellow)
                        }
                    }
                }
            }
        }
    }
    
    private func width(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardNumericViewModelImp.firstRowCount
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.width - totalGaps) / CGFloat(count)
    }
    
    private func zeroWidth(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardNumericViewModelImp.lastRowCount
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        let totalWidth = width(geometry) * CGFloat(count - 1)
        return geometry.size.width - totalGaps - totalWidth
    }
    
    private func height(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardNumericViewModelImp.numericGrid.count
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.height - totalGaps) / CGFloat(count)
    }
}

struct KeyboardNumericView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardNumericView()
    }
}
