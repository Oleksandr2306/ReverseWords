//
//  reverseUITests.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest

class reverseUITests: XCTestCase {
    
    var app: XCUIApplication!
    lazy var inputTF = app.textFields["InputTF"]
    lazy var button = app.buttons["ReverseButton"]
    lazy var resultLabel = app.staticTexts["ResultLabel"]
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test_correctReversedLabel() throws {
        simpleInput()
        
        let result = resultLabel.label
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result)
    }
    
    func test_correctButtonTitle() throws {
        simpleInput()
        XCTAssertEqual(button.label, "Clear")
        button.tap()
        XCTAssertEqual(button.label, "Reverse")
    }
    
    func test_correctPlaceHolder() throws {        
        simpleInput()
        inputTF.tap()
        
        let numberOfSymbols = inputTF.value.debugDescription.count
        for _ in 1...numberOfSymbols - 10 {
            app.keys["delete"].tap()
        }
                
        XCTAssertEqual(inputTF.placeholderValue, "Text to reverse")
    }
    
    func simpleInput() {
        inputTF.tap()
        inputTF.typeText("Test string")
        app.buttons["Return"].tap()
        button.tap()
    }
    
}
