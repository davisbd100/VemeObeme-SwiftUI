//
//  OnboardView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            OnboardStep(imageLocation: "animation_500_kbtxjxmo", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
        })
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
