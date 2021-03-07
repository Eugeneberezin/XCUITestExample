//
//  ScrollingView.swift
//  XCUITestExample.
//
//  Created by Eugene Berezin on 2/25/21.
//

import SwiftUI

struct ScrollingView: View {
    let gridItem = GridItem(.flexible(minimum: 300, maximum: 300))
    
    var body: some View {
        VStack {
            HStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [gridItem], spacing: 5) {
                        ForEach(0...30, id: \.self) { number in
                            Rectangle()
                                .frame(width: 100, height: 100, alignment: .center)
                                .foregroundColor(.blue)
                            
                        }
                        
                    }
                    .accessibility(identifier: "HGRID")
                }
            }
            VStack {
                ScrollView(.vertical) {
                    LazyHGrid(rows: [gridItem, gridItem, gridItem, gridItem], spacing: 3) {
                        ForEach(0...30, id: \.self) { number in
                            Rectangle()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .accessibility(identifier: "VGRID")
                            
                        }
                        
                    }
                }

            }
        }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView()
    }
}
