//
//  ScrollingViewScreen.swift
//  XCUITestExample.UITests
//
//  Created by Eugene Berezin on 2/28/21.
//

import XCTest

class ScrollingViewScreen {
    enum Grids {
        static let hGrid = XCUIApplication().scrollViews.otherElements.otherElements["HGRID"]
        static let vGrid = XCUIApplication().scrollViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).matching(identifier: "VGRID").element(boundBy: 2)
    }
    
    static func swipeUp(element: XCUIElement) {
        element.swipeUp()
    }
    
    static func swipeDown(element: XCUIElement) {
        element.swipeDown()
    }
    
    static func swipeRight(element: XCUIElement) {
        element.swipeRight()
    }
    
    static func swipeLeft(element: XCUIElement) {
        element.swipeLeft()
    }
    
}
