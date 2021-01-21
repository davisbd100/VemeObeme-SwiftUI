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
            ZStack{
                Button(action: {
                    isShown.toggle()
                }, label: {
                    Text("\(title): \(value, formatter: Self.taskDateFormat)")
                        .font(.custom("Avenir Book", size: 15)).padding()
                        .foregroundColor(.black)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: .leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2)
                        )
                })
                HStack{
                    Image(systemName: "calendar")
                        .padding()
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: .trailing)
                }
                
                if(isShown){
                    VStack{
                        DatePicker("Date", selection:$value, in: minDate...maxDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .background(Color.white)
                            .frame(maxWidth: 370)
                        Button(action: {
                            isShown.toggle()
                        }, label: {
                            Text("Aceptar")
                                .frame(alignment: .trailing)
                        })
                    }
                }
            }
        }
    }

