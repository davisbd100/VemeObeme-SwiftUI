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
            LoadingScreenCompleteView()
                .tag(4)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
        }
        .navigationBarTitle("Observación positiva")
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        if (currentTab != 3){
            Button(action: {
                switch (currentTab){
                case 2:
                    currentTab += 1
                    if (viewmodel.newPositiveObservation.comentario.isEmpty){
                        self.codeMessages = "Ingresa un comentario"
                        self.isErrorPresented = true
                        currentTab = 2
                    }else{
                        let dispatch = DispatchGroup()
                        
                        dispatch.enter()
                        viewmodel.registerPositiveObservation(){value in
                            if (value){
                                currentTab = 4
                            }else{
                                codeMessages = "Error al registrar la observacion"
                                isErrorPresented.toggle()
                                currentTab = 2
                            }
                            dispatch.leave()
                        }
                    }
                    break;
                case 4:
                    self.mode.wrappedValue.dismiss()
                    break;
                default:
                    currentTab += 1
                    break;
                }
            }, label: {
                Text(currentTab == 4 ? "Finalizar" : "Siguiente")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: 0, idealWidth: 344, maxWidth: 370, minHeight: 0, idealHeight: 53, maxHeight: 60, alignment: .center)
            })
            .disabled(currentTab == 3)
            .alert(isPresented: $isErrorPresented, content: {
                Alert(title: Text("Error"), message: Text(codeMessages), dismissButton: .default(Text("Cerrar"), action: {
                    isErrorPresented = false
                }))
            })
            .background(Color("ButtonGreen"))
            .cornerRadius(10.0)
        }
    }
}

struct PositiveObservationRootView_Previews: PreviewProvider {
    static var previews: some View {
        PositiveObservationRootView()
    }
}
