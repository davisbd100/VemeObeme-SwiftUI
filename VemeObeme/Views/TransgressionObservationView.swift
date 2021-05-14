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
                                    destination: FaultObservationInfoView(color: Color.init("ic_castigos"), navigationTitle: "Castigos", message: "Las guardias de castigo son un mecanismo de represión en las estancias médicas, ya sea de los médicos adscritos hacia los residentes, de los residentes de mayor jerarquía a los de menor jerarquía, e incluso de los residentes hacia los internos o preinternos. Este tipo de castigos, no sólo representan una violación a los derechos humanos de los afectados, sino que además representan un grave riesgo para la salud, tanto del castigado, como de los pacientes que éste atiende y valora. Debido al cansancio acumulado, el médico es mucho más susceptible a cometer errores, los cuales sufre y paga el paciente. Esto sin mencionar las graves consecuencia legales que dichos errores implican para el médico y para la unidad de salud en general. /n /n Las guardias de castigo están prohibidas por la norma oficial mexicana NOM-001-SSA3-2012, educación en la salud para la organización y funcionamiento de residencias médicas, capítulo 11, fracción 11.8", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 1, tipo: "Castigos"))),
                                    label: {
                                        VStack{
                                            Image("ic_castigos")
                                            Text("Castigos")
                                                .font(.custom("Avenir Book", size: 18))
                                                .foregroundColor(.black)
                                        }
                                    })
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.init("ic_acoso"), navigationTitle: "Acoso sexual", message: "El acoso sexual es la intimidación o acoso de naturaleza sexual o violación, promesas no deseadas o inapropiadas a cambio de favores sexuales. En la mayoría de contextos jurídicos modernos el acoso sexual es ilegal. \n \n De acuerdo con la Ley General de Acceso de las Mujeres a una Vida libre de Violencia, el acoso sexual se define como: \n \n “una forma de violencia en la que, si bien no existe la subordinación, hay un ejercicio abusivo de poder que conlleva a un estado de indefensión y de riesgo para la víctima, independientemente de que se realice en uno o varios eventos”.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 2, tipo: "Acoso Sexual"))),
                                    label: {
                                        VStack{
                                            Image("ic_acoso")
                                            Text("Acoso sexual")
                                                .font(.custom("Avenir Book", size: 18))
                                                .foregroundColor(.black)
                                        }
                                    })
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.init("ic_violencia_verbal"), navigationTitle: "Violencia verbal", message: "La violencia verbal son ataques con palabras destinadas a amedrentar, denostar o maltratar a la víctima con el objeto de causarle daño a corto o largo plazo, siendo una forma de maltrato psicológico que se da en personas de cualquier edad. /n No es necesario usar insultos para ejercer violencia verbal. El tono de la voz y expresiones faciales y corporales pueden provocar las mismas sensaciones en la víctima, siendo más difícil de detectar que otros tipos de maltrato, ya que no deja señales físicas visibles.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 3, tipo: "Violencia verbal"))),
                                    label: {
                                        VStack{
                                            Image("ic_violencia_verbal")
                                            Text("Violencia verbal")
                                                .font(.custom("Avenir Book", size: 18))
                                                .foregroundColor(.black)
                                        }
                                    })
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.init("ic_violencia_fisica"), navigationTitle: "Violencia fisica", message: "La violencia física es la forma de violencia que atañe al cuerpo y a la fuerza física: el castigo corporal, capaz de ocasionar dolor o incluso la muerte, así como sentimientos traumáticos y de humillación. /n La violencia física ocurre cuando una persona trasgrede el espacio corporal de la otra sin su consentimiento, ya sea sometiéndola a golpes, jalones o empujones, o bien encerrándola, provocándole lesiones físicas con algún tipo de objeto (letales o no).", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 4, tipo: "Violencia física"))),
                                    label: {
                                        VStack{
                                            Image("ic_violencia_fisica")
                                            Text("Violencia física")
                                                .font(.custom("Avenir Book", size: 18))
                                                .foregroundColor(.black)
                                        }
                                    })
                                NavigationLink(
                                    destination: FaultObservationInfoView(color: Color.init("ic_otro"), navigationTitle: "Acoso sexual", message: "Si de una forma diferente a las anteriormente listadas, sientes que han faltado a tu derecho a la educación médica y al trato digno y libre de violencia, hazlo saber mediante el registro de una observación general. Siéntete libre de expresar la situación en la sección de comentarios adicionales, más adelante en el formulario.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 5, tipo: "Otro"))),
                                    label: {
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
