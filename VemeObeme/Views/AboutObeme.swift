//
//  AboutObeme.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 14/11/20.
//

import SwiftUI

struct AboutObeme: View {
    @State var currentTab = 1
    @State var isSwipeDisabled = true
    var body: some View {
            VStack{
                TabView(selection: $currentTab,
                        content:  {
                            FirstAboutObemeView(page: $currentTab)
                                .tag(1)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                            SecondAboutObemeView()
                                .tag(2)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
    }
}

struct FirstAboutObemeView: View {
    @Binding var page:Int
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Es un observatorio académico integrante del  Instituto de Salud Pública de la Universidad Veracruzana; reconocido por la Coordinación Universitaria de Observatorios;  investiga los derechos humanos de internos, pasantes y residentes en las unidades médicas. Entre otros:")
                    .font(.custom("Avenir Book", size: 14))
                CustomParagraph(title: "El derecho a la educación médica:", content: "internos, pasantes y residentes son estudiantes de medicina en las unidades médicas que tienen derecho a una educación formal (a un programa académico, un programa operativo, a profesores y supervisores de su práctica clínica y a una evaluación justa de su desempeño académico).")
                CustomParagraph(title: "El derecho a un trato digno y libre de violencia:", content: "internos, pasantes y residentes deben ser tratados en las unidades médicas  de manera digna, libre de acoso y cualquier otro tipo de violencia.")
                    .font(.custom("Avenir Book", size: 14))
                Text("Para mayor información:")
                    .font(.custom("Avenir Heavy", size: 14))
                Link("Pagina oficial del OBEME", destination: URL(string: "https://www.uv.mx/obeme/")!)
                    .font(.custom("Avenir Book", size: 14))
                Link("Pagina de facebook oficial del OBEME", destination: URL(string: "https://www.facebook.com/obemedh/")!)
                    .font(.custom("Avenir Book", size: 14))
                Link("Correo electrónico del OBEME", destination: URL(string: "obeme@uv.mx")!)
                    .font(.custom("Avenir Book", size: 14))
                
            }
            .padding()
            Button(action: {
                page += 1
            }, label: {
                Text("Siguiente")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: 0, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: .center)
            })
            .background(Color("ButtonBlue"))
            .cornerRadius(10.0)
        }
    }
}
struct SecondAboutObemeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ScrollView{
            VStack{
                Text("¡CONTRIBUYE CON EL OBEME!")
                    .font(.custom("Avenir Medium", size: 20))
                Text("Tú puedes contribuir de manera significativa a mejorar tu educación médica y la formación profesional en medicina. Eres una persona con derechos, ¡hazlos valer! Es parte de tu formación integral y responsabilidad como ciudadano, estudiante y futuro médico. ")
                    .font(.custom("Avenir Book", size: 14))
                Text("¿Cómo?")
                    .font(.custom("Avenir Medium", size: 20))
                Text("Tú puedes contribuir de manera significativa a mejorar tu educación médica y la formación profesional en medicina. Eres una persona con derechos, ¡hazlos valer! Es parte de tu formación integral y responsabilidad como ciudadano, estudiante y futuro médico. ")
                    .font(.custom("Avenir Book", size: 14))
                Text("Objetivo")
                    .font(.custom("Avenir Medium", size: 20))
                Text("Recopilar información acerca de incidentes que se presenten en la unidad médica en la que realizas tu internado, servicio social o residencia. Tu reporte permitirá  implementar medidas de prevención y manejo adecuado de  violaciones a los derechos humanos de las y los estudiantes de medicina. Todos los reportes son confidenciales.")
                    .font(.custom("Avenir Book", size: 14))
                Text("¡REPORTA! ES TU DERECHO")
                    .font(.custom("Avenir Medium", size: 20))
            }
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Text("REGRESAR AL INICIO")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: 0, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: .center)
            })
            .background(Color.blue)
            .cornerRadius(10.0)
            .padding()
        }
    }
}

struct AboutObeme_Previews: PreviewProvider {
    static var previews: some View {
        AboutObeme()
    }
}
