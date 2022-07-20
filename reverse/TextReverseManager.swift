//
//  TextReverseManager.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 20.07.2022.
//

import Foundation

final class TextReverseManager {
    func reverse(sentence: String) -> String {
        guard sentence.isEmpty else {
            return String(sentence
                            .components(separatedBy: " ")
                            .map({$0.reversed()})
                            .joined(separator: " "))
        }
        return ""
    }
}
