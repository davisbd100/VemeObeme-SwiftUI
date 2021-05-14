//
//  FaultObservationRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct FaultObservationRootView: View {
    @StateObject var viewmodel: FaultObservationViewModel
    @State var currentTab = 1
    @State var color: Color
    @State var title: String
    
    @State var isLoading = false
    @State var loadingTitle = "Cargando por favor espere"
    @State var isError = false
    @State var isErrorPresented = false
    @State var errorMessage = "Error no identificado"
    @State var isFatalErrorPresented = false
    @State var codeMessages = "UnkownError"
    @State var isSwipeDisabled = true
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            VStack{
                CustomProgressBarView(value: currentTab, maximum: 4)
                TabView(selection:$currentTab){
                    FaultObservationView(viewModel: viewmodel, color: color, isLoading: $isLoading, isFatalError: $isErrorPresented, loadingTitle: $loadingTitle)
                        .tag(1)
                        .gesture(isSwipeDisabled ? DragGesture() : nil)
                    GenericMakeObservation(comments: $viewmodel.comments)
                        .tag(2)
                        .gesture(isSwipeDisabled ? DragGesture() : nil)
                    LoadingScreenObservation()
                        .tag(3)
                        .gesture(isSwipeDisabled ? DragGesture() : nil)
                    LoadingScreenCompleteView()
                        .tag(4)
                        .gesture(isSwipeDisabled ? DragGesture() : nil)
                }
                .navigationTitle(title)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

                if (currentTab != 3){
                    Button(action: {
                        switch (currentTab){
                        case 2:
                            currentTab += 1
                            if (!viewmodel.isCommentsValid || !viewmodel.isPersonTypeValid || !viewmodel.isRegisterDateValid){
                                self.codeMessages = "Revisa los datos e intenta de nuevo"
                                self.isErrorPresented = true
                                debugPrint(self.isErrorPresented)
                                currentTab = 1
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
                    .alert(isPresented: $isErrorPresented, content: {
                        Alert(title: Text("Error"), message: Text(codeMessages), dismissButton: .default(Text("Cerrar"), action: {
                            isErrorPresented = false
                        }))
                    })
                    .background(Color("ButtonGreen"))
                    .cornerRadius(10.0)
                }
            }
            if isLoading{
                CustomLoadingView(title: loadingTitle)
            }
        }
    }
}

struct FaultObservationRootView_Previews: PreviewProvider {
    static var previews: some View {
        FaultObservationRootView(viewmodel: FaultObservationViewModel(faultType: FaultType(idTipoFalta: 2, tipo: "Acoso Sexual")), color: Color.pink, title: "Nocommento")
    }
}
