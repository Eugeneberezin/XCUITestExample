//
//  SecondTestView.swift
//  XCUITestExample.
//
//  Created by Eugene Berezin on 2/24/21.
//

import SwiftUI

struct SecondTestView: View {
    @State private var sliderValue = 0.0
    @State private var selectedIndex = 0
    @State private var isShowingNextView = false
    var pickerValueArray = ["Test1","Test2","Test3","Test4","Test5","Test6" ]
    var body: some View {
            VStack {
                List {
                VStack {
                    Picker("Test PickerWheel", selection: $sliderValue) {
                        ForEach(0 ..< pickerValueArray.count) {
                            Text(pickerValueArray[$0])
                        }
                    }
                    Text("Picker wheel")
                }
                .padding()
                    VStack {
                Slider(value: $sliderValue, in: 0...20)
                Text("\(sliderValue)")
                    }
                }
                
                NavigationLink(destination: Text("Second View"), isActive: $isShowingNextView) { EmptyView() }
                
                Button("Go to the next Screen") {
                    isShowingNextView = true
                }
                Spacer()
                
            }
            .padding()
            
        
    }
    
}
struct SecondTestView_Previews: PreviewProvider {
    static var previews: some View {
        SecondTestView()
    }
}
