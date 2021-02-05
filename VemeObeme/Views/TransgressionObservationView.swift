//
//  TransgresionObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI


struct TransgressionObservationView: View {
    var body: some View {
        VStack{
            Text("¿Qué tipo de falta a derechos sufriste?")
                .font(.custom("Avenir Mediym", size: 18)).padding()
                .multilineTextAlignment(.center)
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible()),
                            GridItem(.flexible())], content: {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Image("ic_castigos")
                            Text("Castigos")
                                .font(.custom("Avenir Book", size: 18))
                                .foregroundColor(.black)
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Image("ic_acoso")
                            Text("Acoso sexual")
                                .font(.custom("Avenir Book", size: 18))
                                .foregroundColor(.black)
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Image("ic_violencia_verbal")
                            Text("Violencia verbal")
                                .font(.custom("Avenir Book", size: 18))
                                .foregroundColor(.black)
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Image("ic_violencia_fisica")
                            Text("Violencia física")
                                .font(.custom("Avenir Book", size: 18))
                                .foregroundColor(.black)
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        VStack{
                            Image("ic_otro")
                            Text("Otro")
                                .font(.custom("Avenir Book", size: 18))
                                .foregroundColor(.black)
                        }
                    })
                })
                .padding(.horizontal)
            }
        }
    }
}

struct TransgressionObservationView_Previews: PreviewProvider {
    static var previews: some View {
        TransgressionObservationView()
    }
}
