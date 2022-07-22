//
//  TextReverseManager.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 20.07.2022.
//

import Foundation

final class TextReverseManager {
    
    func reversedText(sentence: String) -> String {
        guard !sentence.isEmpty else { return "" }
        return String(sentence
                        .components(separatedBy: " ")
                        .map({$0.reversed()})
                        .joined(separator: " "))
    }
}
