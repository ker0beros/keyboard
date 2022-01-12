//
//  KeyboardActionView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardActionView: View {
    
    var keyboardProtocol: KeyboardProtocol?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: KeyboardView.spacing) {
                ForEach(KeyboardActionViewModelImp.actionGrid.indices) { index in
                    HStack(spacing: KeyboardView.spacing) {
                        ForEach(KeyboardActionViewModelImp.actionGrid[index], id: \.self) { action in
                                Button {
                                    keyboardProtocol?.action(action)
                                } label: {
                                    Text(action.rawValue)
                                }
                                .frame(width: width(geometry), height: action == .enter ? enterHeight(geometry) : height(geometry))
                                .background(.red)
                        }
                    }
                }
            }
        }
    }
    
    private func width(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardActionViewModelImp.actionGrid.first?.count ?? 1
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.width - totalGaps) / CGFloat(count)
    }
    
    private func height(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardNumericViewModelImp.numericGrid.count
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.height - totalGaps) / CGFloat(count)
    }
    
    private func enterHeight(_ geometry: GeometryProxy) -> CGFloat {
        let count = KeyboardNumericViewModelImp.numericGrid.count
        let totalGaps = CGFloat(count - 2) * KeyboardView.spacing
        let totalHeight = height(geometry) * CGFloat(count - 2)
        return geometry.size.height - totalGaps - totalHeight
    }
}

struct KeyboardActionView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardActionView()
    }
}
