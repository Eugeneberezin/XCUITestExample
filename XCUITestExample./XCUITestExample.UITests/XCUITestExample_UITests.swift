//
//  XCUITestExample_UITests.swift
//  XCUITestExample.UITests
//
//  Created by Eugene Berezin on 2/18/21.
//

import XCTest

class XCUITestExample_UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let loginTextField = app.textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("dfsdfdfsdfsd")
        app.textFields["Password"].tap()
        sleep(2)
        app.textFields["Password"].typeText("dfsdfsdfsdfsdf")
        
        app.buttons["Login"].tap()
        
        let test1PickerWheel = XCUIApplication().tables.pickerWheels["Test1"]
        test1PickerWheel.adjust(toPickerWheelValue: "Test4")
      
        let slider = XCUIApplication().tables.sliders["0"]
        slider.adjust(toNormalizedSliderPosition: 0.5)

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
