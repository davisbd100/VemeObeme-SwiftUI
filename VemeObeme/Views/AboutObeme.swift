//
//  AboutObeme.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI

struct AboutObeme: View {
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("¿Qué es el OBEME?")
                .font(.custom("Avenir Heavy", size: 24))
                .foregroundColor(.white)
                .background(Color.blue)
                .multilineTextAlignment(.center)
            Text("lopekofdsjgkjdgbkjdbfksdbfskjfbsdkjfsdbkjfbdskjfbsdkjfbsdkjfskjfsdkjfbsdkjfbsdkjfbsdkjfbsdkjfbsdkjfbsdkjfbskjfbsdkjfbskjfbskjfbskjfbsdkfbsdkjfbsdkjfsd")
                .font(.custom("Avenir Book", fixedSize: 14))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
        })
    }
}

struct AboutObeme_Previews: PreviewProvider {
    static var previews: some View {
        AboutObeme()
    }
}
