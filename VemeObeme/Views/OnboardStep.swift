//
//  OnboardStep.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI
import Lottie

struct OnboardStep: View {
    @State var imageLocation: String = "LogoOBEME"
    @State var titleStep: String = "Registra debilidades del proceso educativo en la unidad médica"
    @State var descriptionStep: String = "El cumplimiento de los programas académico y operativo, la supervisión de actividades clínicas, las evaluaciones, el trato que recibes, etc."
    let animation = AnimationView()
    var body: some View {
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            
            Image(imageLocation)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 212, maxWidth: 250, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 212, maxHeight: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text(titleStep)
                .foregroundColor(.blue)
                .font(.custom("Avenir Medium", size: 26))
                .multilineTextAlignment(.center)
                .padding()
            Text(descriptionStep)
                .font(.custom("Avenir Book", size: 16))
                .multilineTextAlignment(.center)
            Spacer()
        })
    }
}

struct OnboardStep_Previews: PreviewProvider {
    static var previews: some View {
        OnboardStep()
    }
}
