//
//  OnboardView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI

struct OnboardView: View {
    @State private var currentTab = 1
    @Binding var showLogin: Bool
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            TabView(selection: $currentTab,
                    content:  {
                        OnboardStep(animationLocation: "health-app", titleStep: "¡Hola!", descriptionStep: "Si eres interno, pasante o residente de medicina esta aplicación es para ti.")
                            .tag(1)
                        OnboardStep(animationLocation: "telescope", titleStep: "¡Bienvenido a Veme OBEME!", descriptionStep: "Desde aquí podrás contribuir a mejorar la educación médica")
                            .tag(2)
                        OnboardStep(animationLocation: "health-report", titleStep: "Colabora con nosotros", descriptionStep: "A través del registro de observaciones de tu estadía en la unidad de salud")
                            .tag(3)
                        OnboardStep(animationLocation: "health-email-green", titleStep: "Registra fortalezas del proceso educativo en la unidad médica", descriptionStep: "El cumplimiento de los programas académico y operativo, la supervisión de actividades clínicas, las evaluaciones, el trato que recibes, etc.")
                            .tag(4)
                        OnboardStep(animationLocation: "health-email-red", titleStep: "Registra debilidades del proceso educativo en la unidad médica", descriptionStep: "El respeto a tus derechos como estudiante y la supervisión en actividades clínicas.")
                            .tag(5)
                        OnboardStep(animationLocation: "safe", titleStep: "Todo es confidencial", descriptionStep: "La información que proveas mediante la aplicación es confidencial. Tu privacidad es nuestra prioridad")
                            .tag(6)
                    })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            Button(action: {
                showLogin.toggle()
            }, label: {
                Text("Comenzar")
                    .font(.custom("Avenir Heavy", size: 15))
            })
        })
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        }
    }
}
