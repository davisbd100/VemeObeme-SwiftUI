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
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.pink, navigationTitle: "Acoso sexual", message: "El acoso sexual es la intimidación o acoso de naturaleza sexual o violación, promesas no deseadas o inapropiadas a cambio de favores sexuales. En la mayoría de contextos jurídicos modernos el acoso sexual es ilegal. \n \n De acuerdo con la Ley General de Acceso de las Mujeres a una Vida libre de Violencia, el acoso sexual se define como: \n \n “una forma de violencia en la que, si bien no existe la subordinación, hay un ejercicio abusivo de poder que conlleva a un estado de indefensión y de riesgo para la víctima, independientemente de que se realice en uno o varios eventos”.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 2, tipo: "Acoso Sexual"))),
                                    label: {
                                        VStack{
                                            Image("ic_castigos")
                                            Text("Castigos")
                                                .font(.custom("Avenir Book", size: 18))
                                                .foregroundColor(.black)
                                        }
                                    })
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.pink, navigationTitle: "Acoso sexual", message: "El acoso sexual es la intimidación o acoso de naturaleza sexual o violación, promesas no deseadas o inapropiadas a cambio de favores sexuales. En la mayoría de contextos jurídicos modernos el acoso sexual es ilegal. \n \n De acuerdo con la Ley General de Acceso de las Mujeres a una Vida libre de Violencia, el acoso sexual se define como: \n \n “una forma de violencia en la que, si bien no existe la subordinación, hay un ejercicio abusivo de poder que conlleva a un estado de indefensión y de riesgo para la víctima, independientemente de que se realice en uno o varios eventos”.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 2, tipo: "Acoso Sexual"))),
                                    label: {
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
