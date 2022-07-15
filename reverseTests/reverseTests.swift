//
//  reverseTests.swift
//  reverseTests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest
@testable import reverse

class reverseTests: XCTestCase {

    var reverseScreen: ReverseWordsViewController!
    
    override func setUpWithError() throws {
        reverseScreen = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reverse") as? ReverseWordsViewController
        reverseScreen.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        reverseScreen = nil
    }

    func testNotEmptyTextFieldWithAlphabeticSymbols() throws {
        
        //Given
        reverseScreen.textField.text = "Test string"
        let expectedResult = "tseT gnirts"
        
        //When
        if reverseScreen.textField.text != nil {
            reverseScreen.button.sendActions(for: .allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(expectedResult, reverseScreen.reversedText.text)
        
    }
    
    func testNotEmptyTextFieldWithNumbers() throws {
        
        //Given
        reverseScreen.textField.text = "3455654"
        let expectedResult = "4565543"
        
        //When
        if reverseScreen.textField.text != nil {
            reverseScreen.button.sendActions(for: .allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(expectedResult, reverseScreen.reversedText.text)
        
    }
    
    func testNotEmptyTextFieldWithOnlyOneSymbol() throws {
        
        //Given
        reverseScreen.textField.text = "A"
        let expectedResult = "A"
        
        //When
        if reverseScreen.textField.text != nil {
            reverseScreen.button.sendActions(for: .allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(expectedResult, reverseScreen.reversedText.text)
        
    }
    
    func testNotEmptyTextFieldWithEmojies() throws {
        
        //Given
        reverseScreen.textField.text = "🙂😌😀"
        let expectedResult = "😀😌🙂"
        
        //When
        if reverseScreen.textField.text != nil {
            reverseScreen.button.sendActions(for: .allTouchEvents)
        }
        
        //Then
        XCTAssertEqual(expectedResult, reverseScreen.reversedText.text)
        
    }

}
