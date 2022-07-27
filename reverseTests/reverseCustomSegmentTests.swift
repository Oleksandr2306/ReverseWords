//
//  reverseCustomTests.swift
//  reverseTests
//
//  Created by Oleksandr Melnyk on 27.07.2022.
//

import XCTest
@testable import reverse

class reverseCustomTests: XCTestCase {

    var result: TextReverseManager!
    
    override func setUp() {
        result = TextReverseManager()
    }
    
    override func tearDown() {
        result = nil
        super.tearDown()
    }
    
    func test_textReverseManager_reverseAlphabeticSymbolsAndNumbers_reverseNonExcludedCharacters() throws {
        
        let input = "Foxminded cool 24/7"
        let expectedResult = "dexdnimoF oocl 7/42"
        let exclusions = "xl"
        XCTAssertEqual(expectedResult, result.reversedTextWithExclusions(sentence: input, ignoredCharacters: exclusions))
        
    }
    
    func test_textReverseManager_numbers_reverseNonExcludedCharacters() throws {
        
        let input = "3455654"
        let expectedResult = "4565543"
        XCTAssertEqual(expectedResult, result.reversedTextWithExclusions(sentence: input, ignoredCharacters: ""))
        
    }
    
    func test_textReverseManager_emojies_reverseNonExcludedCharacters() throws {
        
        let input = "🙂😌😀🦊"
        let expectedResult = "😀😌🙂🦊"
        let exclusions = "🦊"
        XCTAssertEqual(expectedResult, result.reversedTextWithExclusions(sentence: input, ignoredCharacters: exclusions))
        
    }
    
}
