//
//  reverseTests.swift
//  reverseTests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest
@testable import reverse

class reverseTests: XCTestCase {
    
    var result: TextReverseManager!
    
    override func setUp() {
        result = TextReverseManager()
    }
    
    override func tearDown() {
        result = nil
        super.tearDown()
    }
    
    func test_notEmptyTextField_reverseAlphabeticSymbols_defaultSegmentControl() throws {
        
        let input = "Test string"
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseNumbers_defaultSegmentControl() throws {
        
        let input = "3455654"
        let expectedResult = "4565543"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseOnlyOneSymbol_defaultSegmentControl() throws {
        
        let input = "A"
        let expectedResult = "A"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseEmojies_defaultSegmentControl() throws {
        
        let input = "🙂😌😀"
        let expectedResult = "😀😌🙂"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseAlphabeticSymbolsAndNumbers_customSegmentControl() throws {
        
        let input = "Foxminded cool 24/7"
        let expectedResult = "dexdnimoF oocl 7/42"
        let exclusions = "xl"
        XCTAssertEqual(expectedResult, result.reversedTextWithExclusions(phrase: input, ignoredCharacters: exclusions))
        
    }
    
    func test_notEmptyTextField_reverseEmojies_customSegmentControl() throws {
        
        let input = "🙂😌😀🦊"
        let expectedResult = "😀😌🙂🦊"
        let exclusions = "🦊"
        XCTAssertEqual(expectedResult, result.reversedTextWithExclusions(phrase: input, ignoredCharacters: exclusions))
        
    }
    
}


