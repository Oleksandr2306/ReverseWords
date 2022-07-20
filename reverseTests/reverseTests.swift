//
//  reverseTests.swift
//  reverseTests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest
@testable import reverse

class reverseTests: XCTestCase {
    
    func test_notEmptyTextField_reverseAlphabeticSymbols() throws {
        
        let input = "Test string"
        let expectedResult = "tseT gnirts"
        let result = TextReverseManager().reverse(sentence: input)
        XCTAssertEqual(expectedResult, result)
        
    }
    
    func test_notEmptyTextField_reverseNumbers() throws {
        
        let input = "3455654"
        let expectedResult = "4565543"
        let result = TextReverseManager().reverse(sentence: input)
        XCTAssertEqual(expectedResult, result)
        
    }
    
    func test_notEmptyTextField_reverseOnlyOneSymbol() throws {
        
        let input = "A"
        let expectedResult = "A"
        let result = TextReverseManager().reverse(sentence: input)
        XCTAssertEqual(expectedResult, result)
        
    }
    
    func test_notEmptyTextField_reverseEmojies() throws {
        
        let input = "🙂😌😀"
        let expectedResult = "😀😌🙂"
        let result = TextReverseManager().reverse(sentence: input)
        XCTAssertEqual(expectedResult, result)
        
    }
    
}


