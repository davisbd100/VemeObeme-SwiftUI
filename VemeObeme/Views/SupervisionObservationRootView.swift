//
//  SupervisionObservationRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct SupervisionObservationRootView: View {
    @State var currentTab = 1
    @State var isSwipeDisabled = true
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var sss = ""
    var body: some View {
        TabView(selection:$currentTab){
            SupervisionObservationView()
                .tag(1)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            GenericMakeObservation(comments: $sss)
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
            self.mode.wrappedValue.dismiss()
        }
    }, label: {
        Text("Siguiente")
            .foregroundColor(.white)
            .font(.custom("Avenir Heavy", size: 15))
            .frame(minWidth: 0, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: .center)
    })
    .background(Color.blue)
    .cornerRadius(10.0)
}
    }

struct SupervisionObservationRootView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionObservationRootView()
    }
}
