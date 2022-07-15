//
//  reverseUITests.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 04.07.2022.
//

import XCTest

class reverseUITests: XCTestCase {
    
    let inputTF = XCUIApplication().textFields["InputTF"]
    let button = XCUIApplication().buttons["ReverseButton"]

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testSimpleInput() throws {
        let app = XCUIApplication()
        app.launch()
        
        inputTF.tap()
        inputTF.typeText("Test string")
        app.buttons["Return"].tap()
        
        button.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        
        let result = app.staticTexts["ResultLabel"]
        let expectedResult = "tseT gnirts"
        XCTAssertEqual(expectedResult, result.label)
    }
    
    func testInputAndEditing() throws {
        let app = XCUIApplication()
        app.launch()
        
        inputTF.tap()
        inputTF.typeText("Test string")
        app.buttons["Return"].tap()
        
        button.tap()
        
        inputTF.tap()
        inputTF.typeText(" One more string")
        app.buttons["Return"].tap()

        button.tap()
        
        inputTF.tap()
        let numberOfSymbols = inputTF.value.debugDescription.count
        
        for _ in 1...numberOfSymbols - 10 {
            app.keys["delete"].tap()
        }
        inputTF.typeText("New string")
        app.buttons["Return"].tap()
        button.tap(withNumberOfTaps: 2, numberOfTouches: 1)
        
        let result = app.staticTexts["ResultLabel"]
        let expectedResult = "weN gnirts"
        XCTAssertEqual(expectedResult, result.label)

    }
}
