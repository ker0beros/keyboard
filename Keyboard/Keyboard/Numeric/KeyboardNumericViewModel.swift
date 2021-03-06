//
//  KeyboardNumericViewModel.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import Foundation

enum KeyboardNumeric: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4", five = "5", six = "6", seven = "7", eight = "8", nine = "9", dot = "."
}

final class KeyboardNumericViewModelImp {
    
    static let numericGrid: [[KeyboardNumeric]] = [
        [.seven, .eight, .nine],
        [.four, .five, .six],
        [.one, .two, .three],
        [.dot, .zero]
    ]
    
    static var firstRowCount: Int {
        numericGrid.first?.count ?? 0
    }
    
    static var lastRowCount: Int {
        numericGrid.last?.count ?? 0
    }
}
