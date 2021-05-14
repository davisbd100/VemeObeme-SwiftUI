//
//  CustomDatePicker.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var value: Date
    var title: String
    var maxDate: Date
    var minDate: Date
    @State var isShown: Bool = false
    
    
    static let taskDateFormat: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter
        }(
    )
    var body: some View{
        DatePicker(title, selection:$value, in: minDate...maxDate, displayedComponents: .date)
            .background(Color.white)
            .accentColor(.black)
            .font(.custom("Avenir Book", size: 14)).padding()
            .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
        }
    }

