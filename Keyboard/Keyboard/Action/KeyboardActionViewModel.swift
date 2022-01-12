//
//  KeyboardActionViewModel.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import Foundation

enum KeyboardAction: String {
    case backspace, clear, enter
}

protocol KeyboardActionProtocol: ObservableObject {}

final class KeyboardActionViewModelImp: KeyboardActionProtocol {
    
    static let actionGrid: [[KeyboardAction]] = [
        [.backspace],
        [.clear],
        [.enter]
    ]
    
}
