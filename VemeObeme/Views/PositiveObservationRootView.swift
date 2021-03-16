//
//  PositiveObservationRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct PositiveObservationRootView: View {
    @StateObject var viewmodel: PositiveObservationViewModel = PositiveObservationViewModel()
    @State var currentTab = 1
    @State var isSwipeDisabled = true
    @State var isErrorPresented = false
    @State var codeMessages = "UnkownError"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        TabView(selection:$currentTab){
            PositiveObservationView(viewmodel: viewmodel)
                .tag(1)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            GenericMakeObservation(comments: $viewmodel.newPositiveObservation.comentario)
                .tag(2)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            LoadingScreenObservation()
                .tag(3)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
                .onAppear(perform: {
                    if (viewmodel.newPositiveObservation.comentario.isEmpty){
                        currentTab -= 1
                    }
                    let dispatch = DispatchGroup()
                    
                    dispatch.enter()
                    viewmodel.registerPositiveObservation(){value in
                        if (value){
                            currentTab += 1
                        }else{
                            codeMessages = "Error al registrar la observacion"
                            isErrorPresented.toggle()
                        }
                        dispatch.leave()
                    }
                })
            LoadingScreenCompleteView()
                .tag(4)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        Button(action: {
            if (currentTab < 3){
                currentTab += 1
            }else if (currentTab == 4){
                self.mode.wrappedValue.dismiss()
            }
        }, label: {
            Text("Siguiente")
                .foregroundColor(.white)
                .font(.custom("Avenir Heavy", size: 15))
                .frame(minWidth: 0, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: .center)
        })        .alert(isPresented: $isErrorPresented, content: {
            Alert(title: Text("Error"), message: Text(codeMessages), dismissButton: .default(Text("Cerrar"), action: {
                isErrorPresented = false
            }))
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
