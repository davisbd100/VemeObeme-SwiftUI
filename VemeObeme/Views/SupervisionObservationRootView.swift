//
//  SupervisionObservationRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct SupervisionObservationRootView: View {
    @StateObject var viewmodel = SupervisionObservationViewModel()
    @State var currentTab = 1
    @State var isErrorPresented = false
    @State var codeMessages = "UnkownError"
    @State var isSwipeDisabled = true

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        TabView(selection:$currentTab){
            SupervisionObservationView()
                .tag(1)
                .gesture(isSwipeDisabled ? DragGesture() : nil)
            GenericMakeObservation(comments: $viewmodel.newSupervisionObservation.comentario)
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
        switch (currentTab){
        case 2:
            currentTab += 1
            if (viewmodel.newSupervisionObservation.comentario.isEmpty){
                self.codeMessages = "Ingresa un comentario"
                self.isErrorPresented = true
                currentTab = 2
            }else{
                let dispatch = DispatchGroup()
                
                dispatch.enter()
                viewmodel.registerSupervisionObservation(){value in
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
    .background(Color.blue)
    .cornerRadius(10.0)
}
    }

struct SupervisionObservationRootView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionObservationRootView()
    }
}
