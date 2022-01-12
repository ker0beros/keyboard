//
//  KeyboardNumericView.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import SwiftUI

struct KeyboardNumericView: View {
    
    @ObservedObject private var vm = KeyboardNumericViewModelImp()
    
    var body: some View { // TODO refactor
        GeometryReader { geometry in
            VStack(spacing: KeyboardView.spacing) {
                ForEach(vm.numericGrid.indices) { index in
                    HStack(spacing: KeyboardView.spacing) {
                        ForEach(vm.numericGrid[index], id: \.self) { numeric in
                                Button {
                                    // binding
                                } label: {
                                    Text(numeric.rawValue) // TODO use custom font
                                }
                                .frame(width: numeric == .zero ? zeroWidth(geometry) : width(geometry), height: height(geometry))
                                .background(.green)
                        }
                    }
                }
            }
        }
    }
    
    private func width(_ geometry: GeometryProxy) -> CGFloat {
        let count = vm.numericGrid.first?.count ?? 1
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.width - totalGaps) / CGFloat(count)
    }
    
    private func zeroWidth(_ geometry: GeometryProxy) -> CGFloat {
        let count = vm.numericGrid.last?.count ?? 1
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        let totalWidth = width(geometry) * CGFloat(count - 1)
        return geometry.size.width - totalGaps - totalWidth
    }
    
    private func height(_ geometry: GeometryProxy) -> CGFloat {
        let count = vm.numericGrid.count
        let totalGaps = CGFloat(count - 1) * KeyboardView.spacing
        return (geometry.size.height - totalGaps) / CGFloat(count)
    }
}

struct KeyboardNumericView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardNumericView()
    }
}
