//
//  KeyboardProtocol.swift
//  Keyboard
//
//  Created by Khairul Azmi on 12/01/2022.
//

import Foundation

protocol KeyboardProtocol {
    func character(_ char: String)
    func action(_ button: KeyboardAction)
}
