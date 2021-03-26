//
//  PeriodHelper.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct PeriodHelper: View {
    @State var stays: [Stay]
    var body: some View {
        ForEach(stays, id: \.self){ value in
            if (value != stays.last){
                Text("Periodo \(value.idEstancia ?? 0): " + getMonthStringDateForShowing(date: (value.fechaInicio)!) + " - " + getMonthStringDateForShowing(date: (value.fechaFin)!))
                    .font(.custom("Avenir Book", size: 14))
            }
        }
    }
}

struct PeriodHelper_Previews: PreviewProvider {
    static var previews: some View {
        PeriodHelper(stays: [])
    }
}
