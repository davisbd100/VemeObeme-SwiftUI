//
//  OnboardView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI

struct OnboardView: View {
    @State private var currentTab = 1
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            TabView(selection: $currentTab,
                    content:  {
                        OnboardStep(animationLocation: "health-report", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(1)
                        OnboardStep(animationLocation: "health-report", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(2)
                        OnboardStep(animationLocation: "health-report", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(3)
                        OnboardStep(animationLocation: "health-report", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(4)
                        OnboardStep(animationLocation: "health-report", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(5)
                    })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        })
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
