//
//  LoginScreen.swift
//  XCUITestExample.UITests
//
//  Created by Eugene Berezin on 2/28/21.
//

import XCTest

class LoginScreen {
    static let app = XCUIApplication()
    
    enum TextFields {
        static let login = app.textFields["Login"]
        static let password = app.textFields["Password"]
    }
    
    enum Buttions {
        static let login = app.buttons["Login"]
    }
    
    static func login(login: String, password: String) {
        TextFields.login.tap()
        TextFields.login.typeText(login)
        TextFields.password.tap()
        TextFields.password.typeText(password)
        
        XCTAssertTrue(Buttions.login.isEnabled)
        if Buttions.login.isEnabled {
            Buttions.login.tap()
        } else {
            XCTFail("Button is not enabled")
        }
    }
    
}

