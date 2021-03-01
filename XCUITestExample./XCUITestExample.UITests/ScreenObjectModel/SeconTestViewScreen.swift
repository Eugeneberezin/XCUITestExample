//
//  SeconTestViewScreen.swift
//  XCUITestExample.UITests
//
//  Created by Eugene Berezin on 2/28/21.
//

import Foundation
import XCTest

class SeconTextViewScreen {
    enum Sliders  {
        static let slider = XCUIApplication().tables.sliders["0"]
    }
    
    enum PickerWheels {
        static let pickerWheel = XCUIApplication().tables.pickerWheels["Test1"]
    }
    
    enum StaticText {
        static let label = XCUIApplication().tables.staticTexts["10.000000"]
    }
    
    enum Buttons {
        static let goToTheNextScreen = XCUIApplication().buttons["Go to the next Screen"]
    }
    
    static func adjust(toNormalizedSliderPosition: CGFloat) {
        Sliders.slider.adjust(toNormalizedSliderPosition: toNormalizedSliderPosition)
    }
    
    static func adjust(toPickerWheelValue: String) {
        PickerWheels.pickerWheel.adjust(toPickerWheelValue: toPickerWheelValue)
    }
}
