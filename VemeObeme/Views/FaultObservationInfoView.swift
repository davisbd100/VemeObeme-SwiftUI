//
//  FaultObservationInfoView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 25/03/21.
//

import SwiftUI

struct FaultObservationInfoView: View {
    @State var color: Color
    @State var navigationTitle: String
    @State var message: String
    @StateObject var viewmodel: FaultObservationViewModel
    var body: some View {
        VStack{
            Text(message)
                .font(.custom("Avenir Book", size: 16))
            Spacer()
            NavigationLink(
                destination: FaultObservationRootView(viewmodel: viewmodel, color: color),
                label: {
                    Text("Siguiente")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Heavy", size: 15))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .background(Color.green)
                .cornerRadius(10.0)
        }
        .padding()
        .navigationBarTitle(navigationTitle, displayMode: .inline)
    }
}

struct FaultObservationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FaultObservationInfoView(color: Color.pink, navigationTitle: "Acoso Sexual", message: "El acoso sexual es la intimidación o acoso de naturaleza sexual o violación, promesas no deseadas o inapropiadas a cambio de favores sexuales. En la mayoría de contextos jurídicos modernos el acoso sexual es ilegal. \n \n De acuerdo con la Ley General de Acceso de las Mujeres a una Vida libre de Violencia, el acoso sexual se define como: \n \n “una forma de violencia en la que, si bien no existe la subordinación, hay un ejercicio abusivo de poder que conlleva a un estado de indefensión y de riesgo para la víctima, independientemente de que se realice en uno o varios eventos”.", viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 2, tipo: "Acoso Sexual")))
    }
}
