//
//  SimpleCheckbox.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct SimpleCheckbox: View {
    @Binding var isChecked:Bool
    var title:String
    
    func toggle(){isChecked.toggle()}
    var body: some View {
        Button(action: toggle){
            HStack{
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(title)
                    .font(.custom("Avenir Book", size: 15))
            }
        }
        .foregroundColor(.black)

    }

}
