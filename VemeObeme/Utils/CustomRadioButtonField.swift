//
//  CustomRadioButtonField.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct CustomRadioButtonField: View {
    let label: String
    @Binding var isMarked:Bool
    
    var body: some View {
        Button(action:{
            isMarked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text(label)
                    .font(Font.system(size: 15))
                Spacer()
            }.foregroundColor(Color.black)
        }
        .foregroundColor(Color.white)
    }
}
