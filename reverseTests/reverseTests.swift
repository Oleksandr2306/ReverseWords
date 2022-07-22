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
    
    func test_notEmptyTextField_reverseAlphabeticSymbols() throws {
        
        let input = "Test string"
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseNumbers() throws {
        
        let input = "3455654"
        let expectedResult = "4565543"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseOnlyOneSymbol() throws {
        
        let input = "A"
        let expectedResult = "A"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    func test_notEmptyTextField_reverseEmojies() throws {
        
        let input = "🙂😌😀"
        let expectedResult = "😀😌🙂"
        XCTAssertEqual(expectedResult, result.reversedText(sentence: input))
        
    }
    
    override func tearDown() {
        result = nil
        super.tearDown()
    }
    
}


