//
//  RegisterView_Root.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 19/11/20.
//

import SwiftUI

struct RegisterView_Root: View {
    @State private var currentTab = 1
    var body: some View {
        VStack{
            Text("Registrarse")
            TabView(selection: $currentTab,
                    content:  {
                        tabItem {
                            Text("View1")
                        }
                        .tag(1)
                        tabItem{
                            Text("View2")
                        }
                        .tag(2)
                        tabItem{
                            Text("View3")
                        }
                        .tag(3)
                    })
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            
            
            Button(action: {
                currentTab+=1
            }, label: {
                Text("Siguiente")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.blue)
            .cornerRadius(10.0)
        }
    }
}
struct RegisterView_Root_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView_Root()
    }
}

