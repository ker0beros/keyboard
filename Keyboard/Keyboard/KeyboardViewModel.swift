//
//  KeyboardViewModel.swift
//  Keyboard
//
//  Created by Khairul Azmi on 12/01/2022.
//

import Foundation

protocol KeyboardViewModel: ObservableObject {}

final class KeyboardViewModelImp: KeyboardViewModel {
    

}

extension KeyboardViewModelImp: KeyboardProtocol {
    func character(_ char: String) {
        print("char", char)
    }
    
    func action(_ button: KeyboardAction) {
        print("action", button)
    }
}
