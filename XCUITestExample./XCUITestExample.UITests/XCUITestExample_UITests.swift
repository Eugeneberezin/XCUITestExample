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

    func testExample() throws {
        app.buttons["Login"].tap()
        
        let test1PickerWheel = XCUIApplication().tables.pickerWheels["Test1"]
        test1PickerWheel.adjust(toPickerWheelValue: "Test4")
      
        let slider = XCUIApplication().tables.sliders["0"]
        slider.adjust(toNormalizedSliderPosition: 0.5)

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
        
        let vGrid = XCUIApplication()/*@START_MENU_TOKEN@*/.scrollViews.containing(.other, identifier:"Vertical scroll bar, 4 pages")/*[[".scrollViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\")",".scrollViews.containing(.other, identifier:\"Vertical scroll bar, 4 pages\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).matching(identifier: "VGRID").element(boundBy: 2)
        vGrid.swipeDown()
        vGrid.swipeUp()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
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
