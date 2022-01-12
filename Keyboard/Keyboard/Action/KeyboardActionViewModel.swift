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

final class KeyboardActionViewModelImp {
    
    static let actionGrid: [[KeyboardAction]] = [
        [.backspace],
        [.clear],
        [.enter]
    ]
    
    static var firstRowCount: Int {
        actionGrid.first?.count ?? 0
    }
}
