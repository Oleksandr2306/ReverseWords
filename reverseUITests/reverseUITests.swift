//
//  reverseUITests.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest

class reverseUITests: XCTestCase {
    
    var app: XCUIApplication!
    lazy var inputTextField = app.textFields["InputTF"]
    lazy var exclusionTextField = app.textFields["ExclusionTextField"]
    lazy var button = app.buttons["ReverseButton"]
    lazy var resultLabel = app.staticTexts["ResultLabel"]
    lazy var deleteKey = XCUIKeyboardKey.delete
    lazy var defaultSegment = app.buttons["Default"]
    lazy var customSegment = app.buttons["Custom"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_correctReversedLabel_defaultSegmentControl() throws {
        prepareStubbedInput()
        
        let result = resultLabel.label
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_reverseButton_hasCorrectTitleAfterClear() throws {
        prepareStubbedInput()
        button.tap()
        XCTAssertEqual(button.label, "Reverse")
    }
    
    func test_inputTextField_hasCorrectPlaceholder() throws {
        prepareStubbedInput()
        inputTextField.tap()
        let numberOfSymbols = inputTextField.value.debugDescription.count
        for _ in 1...numberOfSymbols - 10 {
            inputTextField.typeText(deleteKey.rawValue)
        }
        
        if inputTextField.value.debugDescription.isEmpty {
            XCTAssertEqual(inputTextField.placeholderValue, "Text to reverse")
        }
    }
    
    func test_correctReversedLabel_customSegmentControl() throws {
        customSegment.tap()
        prepareStubbedInput()
        
        exclusionTextField.tap()
        exclusionTextField.typeText("ing")
        app.buttons["Return"].tap()
        button.tap()
        
        let result = resultLabel.label
        let expectedResult = "tseT rtsing"
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_exclusionTextField_hasCorrectPlaceholder() throws {
        customSegment.tap()
        XCTAssertEqual(exclusionTextField.placeholderValue, "Text to ignore")
    }
    
    func test_reverseButton_hasCorrectTitleAfterExclusionsInput() throws {
        customSegment.tap()
        prepareStubbedInput()
        
        exclusionTextField.tap()
        exclusionTextField.typeText("ing")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(button.label, "Reverse")
    }
    
    private func prepareStubbedInput() {
        inputTextField.tap()
        inputTextField.typeText("Test string")
        app.buttons["Return"].tap()
        button.tap()
        XCTAssertEqual(button.label, "Clear")
    }
    
}
