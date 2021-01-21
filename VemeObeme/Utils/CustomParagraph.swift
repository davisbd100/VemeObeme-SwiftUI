//
//  CustomParagraph.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct CustomParagraph: View {
    var title: String
    var content: String
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(title)")
                .font(.custom("Avenir Medium", size: 14))
            Text("\(content) \n")
                .font(.custom("Avenir Book", size: 14))
                .multilineTextAlignment(.leading)
        }
    }
}
struct CustomParagraph_Previews: PreviewProvider {
    static var previews: some View {
        CustomParagraph(title: "TestTittle", content: "TestContent")
    }
}
