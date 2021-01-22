//
//  TransgressionObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct TransgressionObservation: View {
    var body: some View {
        VStack{
            Text("¿Qué tipo de falta a derechos sufriste?")
                .font(.custom("Avenir Mediym", size: 18))
            padding()
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image("ic_castigos")
                        Text("Castigos")
                    }
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image("ic_acoso")
                        Text("Acoso Sexual")
                    }
                })
            }
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image("ic_violencia_verbal")
                        Text("Violencia verbal")
                    }
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image("ic_violencia_fisica")
                        Text("Violencia física")
                    }
                })
            }
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    VStack{
                        Image("ic_otros")
                        Text("Otros")
                    }
                })
            }
            Spacer()
        }
        
    }
}

struct TransgressionObservation_Previews: PreviewProvider {
    static var previews: some View {
        TransgressionObservation()
    }
}
