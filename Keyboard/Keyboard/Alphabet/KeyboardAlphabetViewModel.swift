//
//  KeyboardAlphabetViewModel.swift
//  Keyboard
//
//  Created by Khairul Azmi on 11/01/2022.
//

import Foundation

enum KeyboardAlphabet: String {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
    case at = "@", shift, exclamation = "!", question = "?", leftParenthesis = "(", rightParenthesis = ")", dollar = "$", space = " ", plus = "+", minus = "-", percentage = "%"
}

protocol KeyboardAlphabetProtocol: ObservableObject {
    func toggleCase()
}

final class KeyboardAlphabetViewModelImp: KeyboardAlphabetProtocol {

    static let alphabetsGrid: [[KeyboardAlphabet]] = [
        [.Q, .W, .E, .R, .T, .Y, .U, .I, .O, .P],
        [.A, .S, .D, .F, .G, .H, .J, .K, .L, .at],
        [.shift, .Z, .X, .C, .V, .B, .N, .M, .exclamation, .question],
        [.leftParenthesis, .rightParenthesis, .dollar, .space, .plus, .minus, .percentage]
    ]
    
    @Published var uppercase: Bool = true
    
    func toggleCase() {
        uppercase.toggle()
    }
}
