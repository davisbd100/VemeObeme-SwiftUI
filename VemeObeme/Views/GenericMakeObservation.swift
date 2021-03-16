//
//  GenericMakeObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct GenericMakeObservation: View {
    @Binding var comments: String
    var body: some View {
        VStack(alignment: .leading){
            Divider()
            HStack{
                Image(systemName: "info.circle")
                Text("Observaciones")
                    .font(.custom("Avenir Book", size: 16))
                    .foregroundColor(.green)
                    .padding()
            }
            TextEditor(text: $comments)
                .frame(minWidth: 220, idealWidth: 344, minHeight: 200, idealHeight: 233, maxHeight: 250)
                .border(Color.green)
            Spacer()
        }
        .padding()
    }
}

