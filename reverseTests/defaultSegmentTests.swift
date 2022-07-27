//
//  reverseTests.swift
//  reverseTests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest
@testable import reverse

class defaultSegmentTests: XCTestCase {
    
    var result: TextReverseManager!
    
    override func setUp() {
        result = TextReverseManager()
    }
    
    override func tearDown() {
        result = nil
        super.tearDown()
    }
    
    func test_textReverseManager_alphabeticSymbols_reverseExcludedCharacters() throws {
        
        let input = "Test string"
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_textReverseManager_numbers_reverseExcludedCharacters() throws {
        
        let input = "3455654"
        let expectedResult = "3455654"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_textReverseManager_onlyOneSymbol_reverseExcludedCharacters() throws {
        
        let input = "A"
        let expectedResult = "A"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_textReverseManager_emojies_reverseExcludedCharacters() throws {
        
        let input = "🙂😌😀"
        let expectedResult = "🙂😌😀"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
}


