//
//  CustomLoadingView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 25/02/21.
//

import SwiftUI

struct CustomLoadingView: View {
    var title = "Default title"
    var animationFilename = "electro"
    var body: some View {
        GeometryReader { geo in
            VStack{
                Text(title)
                    .foregroundColor(.green)
                    .font(.custom("Avenir Heavy", size: 30))
                LottieView(filename: "electro", loopMode: .loop)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: 200, alignment: Alignment(horizontal: .center, vertical: .center))
            }
            .background(Color.white.opacity(0.60))
            .padding()
            .position(x:geo.frame(in:.global).midX,y:geo.frame(in:.global).midY)
        }.background(Color.black.opacity(0.45).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct CustomLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingView()
    }
}
