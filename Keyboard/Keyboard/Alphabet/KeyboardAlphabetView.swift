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
    //                        if alphabet == .space {
    //                            Button {
    //                                print("handle action of \(alphabet)")
    //                            } label: {
    //                                Text(alphabet.rawValue)
    //                            }
    //                            .frame(maxWidth: ., maxHeight: .infinity)
    //                            .background(.green)
    //                        } else {
                                Button {
                                    print("handle action of \(alphabet)")
                                } label: {
                                    Text(alphabet.rawValue)
                                }
                                .frame(width: geometry.size.width / 10, height: geometry.size.height / 4)
                                .background(.green)
    //                        }
                        }
                    }
                }
            }
        }
    }
    
    func width(_ geometry: GeometryProxy, alphabet: KeyboardAlphabet) -> CGFloat {
        
    }
    
    func height() -> CGFloat {
        
    }
}

struct KeyboardAlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardAlphabetView()
            .previewInterfaceOrientation(.landscapeRight)
            .previewLayout(.sizeThatFits)
    }
}
