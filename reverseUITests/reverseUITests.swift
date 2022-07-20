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
    lazy var button = app.buttons["ReverseButton"]
    lazy var resultLabel = app.staticTexts["ResultLabel"]
    lazy var deleteKey = app.keys["delete"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_correctReversedLabel() throws {
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
    
    func test_textField_hasCorrectPlaceHolder() throws {
        prepareStubbedInput()
        inputTextField.tap()
        
        let numberOfSymbols = inputTextField.value.debugDescription.count
        for _ in 1...numberOfSymbols - 10 {
            deleteKey.tap()
        }
        
        if inputTextField.value.debugDescription.isEmpty {
            XCTAssertEqual(inputTextField.placeholderValue, "Text to reverse")
        }
    }
    
    private func prepareStubbedInput() {
        inputTextField.tap()
        inputTextField.typeText("Test string")
        app.buttons["Return"].tap()
        button.tap()
        XCTAssertEqual(button.label, "Clear")
    }
    
}
