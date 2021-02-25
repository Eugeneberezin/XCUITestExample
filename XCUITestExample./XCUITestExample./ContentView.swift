//
//  ContentView.swift
//  XCUITestExample.
//
//  Created by Eugene Berezin on 2/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var isEnabled = true
    @State private var isShowingNextView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Login", text: $login)

                    .padding(10)
                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding()
                
                TextField("Password", text: $password)
                    .padding(10)
                    .font(Font.system(size: 15, weight: .medium, design: .serif))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                    .padding()

                NavigationLink(destination: Text("Second View"), isActive: $isShowingNextView) { EmptyView() }
                Button("Login") {
                    isShowingNextView = true
                }
                .disabled(enableButton())
                .foregroundColor(.white)
                .frame(width: 250, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(disabledColor())
                .cornerRadius(8)
                Spacer()
            }
            
            .ignoresSafeArea()

            
        }

    }
    
    private func disabledColor() -> Color {
        if !login.isEmpty && !password.isEmpty {
            return Color(.systemBlue)
        } else {
            return Color(.systemGray)
        }
    }
    
    private func enableButton() -> Bool {
        if !login.isEmpty && !password.isEmpty {
            return false
        } else {
            return true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
