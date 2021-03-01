//
//  XCUITestExample_UITests.swift
//  XCUITestExample.UITests
//
//  Created by Eugene Berezin on 2/18/21.
//

import XCTest

class XCUITestExample_UITests: XCTestCase {
    let app = XCUIApplication()
    

    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    func testHowToHandleTextFields() {
        let loginTextField = app.textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("dfsdfdfsdfsd")
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("TestPassword")
    }
    
    func testHowToHandleButtons() {
        let button = app.buttons["Login"]
        XCTAssertTrue(!button.isEnabled)
        let loginTextField = app.textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("dfsdfdfsdfsd")
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("TestPassword")
        XCTAssertTrue(button.isEnabled)
        if button.isEnabled {
            button.tap()
        } else {
            XCTFail("Button is not enabled")
        }
    }
    
    func testHowToHandleSliders() {
        login()
        let slider = XCUIApplication().tables.sliders["0"]
        slider.adjust(toNormalizedSliderPosition: 0.5)
    }
    
    func testHowToHandleSwipeGestures() {
        login()
        XCUIApplication().buttons["Go to the next Screen"].tap()
        let hGrid = XCUIApplication().scrollViews.otherElements.otherElements["HGRID"]
        hGrid.swipeLeft()
        hGrid.swipeRight()
        
        let vGrid = XCUIApplication().scrollViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).matching(identifier: "VGRID").element(boundBy: 2)
        vGrid.swipeDown()
        vGrid.swipeUp()
    }
    
    func testLoginWithPageObjectModel() {
        LoginScreen.login(login: "TestLogin", password: "TestPassword")
        XCTAssert(SeconTextViewScreen.Sliders.slider.waitForExistence(timeout: 5))
        SeconTextViewScreen.adjust(toNormalizedSliderPosition: 0.5)
        XCTAssert(SeconTextViewScreen.StaticText.label.exists)
        SeconTextViewScreen.adjust(toPickerWheelValue: "Test4")
        XCTAssert(XCUIApplication().tables.pickerWheels["Test4"].exists)
        SeconTextViewScreen.Buttons.goToTheNextScreen.tap()
        ScrollingViewScreen.swipeDown(element: ScrollingViewScreen.Grids.vGrid)
        ScrollingViewScreen.swipeUp(element: ScrollingViewScreen.Grids.vGrid)
        ScrollingViewScreen.swipeLeft(element: ScrollingViewScreen.Grids.hGrid)
        ScrollingViewScreen.swipeRight(element: ScrollingViewScreen.Grids.hGrid)
        
    }
}

// THIS IS NOT PAGE OBJECT MODEL PART! CONVINIENCE EXTENSION!
extension XCTestCase {
    func login() {
        let button = XCUIApplication().buttons["Login"]
        let loginTextField = XCUIApplication().textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("dfsdfdfsdfsd")
        let passwordTextField = XCUIApplication().textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("TestPassword")
        XCTAssertTrue(button.isEnabled)
        if button.isEnabled {
            button.tap()
        } else {
            XCTFail("Button is not enabled")
        }
    }
}
