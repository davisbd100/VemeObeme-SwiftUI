//
//  PositiveObservationRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct PositiveObservationRootView: View {
    @State var currentTab = 1
    @State var isSwipeDisabled = true
    var body: some View {
        TabView(selection:$currentTab){
            PositiveObservationRootView()
                .tag(1)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            GenericMakeObservation()
                .tag(2)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            LoadingScreenObservation()
                .tag(3)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            LoadingScreenCompleteView()
                .tag(4)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        Button(action: {
            if (currentTab < 4){
                currentTab += 1
            }else{
                
            }
        }, label: {
            Text("Siguiente")
                .foregroundColor(.white)
                .font(.custom("Avenir Heavy", size: 15))
                .frame(minWidth: 0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center)
        })
        .background(Color.blue)
        .cornerRadius(10.0)
    }
}

struct PositiveObservationRootView_Previews: PreviewProvider {
    static var previews: some View {
        PositiveObservationRootView()
    }
}
