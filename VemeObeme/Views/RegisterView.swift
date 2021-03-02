//
//  RegisterView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 09/12/20.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @State var currentTab = 1
    @State var isSwipeDisabled = true
    @State var isLoading = false
    @State var loadingTitle = "Cargando, por favor espere"
    @State var isTermsAndConditionsAccepted = false
    @State var isError = false
    @State var errorMessage = "Error desconocido"
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack{
                    Button(action: {
                        if (currentTab <= 1){
                            self.mode.wrappedValue.dismiss()
                        }else{
                            currentTab -= 1
                        }
                    }, label: {
                        Image(systemName: "arrow.left.circle")
                            .foregroundColor(.white)
                    })
                    Text("Registro")
                        .font(.custom("Avenir Heavy", size: 24))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }.background(Color.blue)
                CustomProgressBarView(value: currentTab, maximum: 5)
                if (currentTab == 5){
                    FifthRegisterView(viewModel: viewModel, isLoading: $isLoading, loadingTitle: $loadingTitle)
                }else{
                    TabView(selection: $currentTab,
                            content:  {
                                FirstRegisterView(viewModel: viewModel)
                                    .tag(1)
                                    .gesture(isSwipeDisabled ? DragGesture() : nil)
                                SecondRegisterView(viewModel: viewModel, isLoading: $isLoading, loadingTitle: $loadingTitle)
                                    .tag(2)
                                    .gesture(isSwipeDisabled ? DragGesture() : nil)
                                ThirdRegisterView(viewModel: viewModel, isLoading: $isLoading, loadingTitle: $loadingTitle)
                                    .tag(3)
                                    .gesture(isSwipeDisabled ? DragGesture() : nil)
                                FourthRegisterView(viewModel: viewModel)
                                    .tag(4)
                                    .gesture(isSwipeDisabled ? DragGesture() : nil)
                            })
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    Button(action: {
                        switch currentTab{
                        case 1:
                            if(viewModel.isGenderValid && viewModel.isBirthDateValid){
                                currentTab += 1
                            }else{
                                errorMessage = "Datos invalidos, revisa los datos ingresados"
                                isError.toggle()
                            }
                            break;
                        case 2:
                            if(viewModel.isCountryValid && viewModel.isUniversityValid){
                                currentTab += 1
                            }else{
                                errorMessage = "Datos invalidos, revisa los datos ingresados"
                                isError.toggle()
                            }
                            break;
                        case 3:
                            if(viewModel.isHealthInstitutionValid && viewModel.isStayTypeValid && ((viewModel.isResidencySelected && viewModel.isEspecialityValid) || !viewModel.isResidencySelected) && viewModel.isStartDateValid && viewModel.isEndDateValid){
                                currentTab += 1
                            }else{
                                errorMessage = "Datos invalidos, revisa los datos ingresados"
                                isError.toggle()
                            }
                            break;
                        case 4:
                            if(viewModel.isMailValid && viewModel.isPasswordValid && viewModel.password == viewModel.confirmPassword){
                                isLoading.toggle()
                                loadingTitle = "Comprobando correo"
                                let dispatch = DispatchGroup()
                                
                                dispatch.enter()
                                viewModel.checkIfEmailExists{value in
                                    if (!value){
                                        isLoading.toggle()
                                        loadingTitle = "Cargando"
                                        currentTab += 1
                                    }else{
                                        isLoading.toggle()
                                        loadingTitle = "Cargando"
                                        errorMessage = "Correo existente"
                                        isError.toggle()
                                    }
                                    dispatch.leave()
                                }
                            }else{
                                errorMessage = "Datos invalidos, revisa los datos ingresados"
                                isError.toggle()
                            }
                            break;
                        default:
                            errorMessage = "Error desconocido"
                            isError.toggle()
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
                
            })
            .navigationBarHidden(true)
            .alert(isPresented: $isError, content: {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("Cerrar"), action: {
                    isError = false
                }))
            })
            if isLoading{
                CustomLoadingView(title: loadingTitle)
            }
        }
    }
}


struct FirstRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        Form {
            Text("Datos Personales")
                .padding(.leading)
            CustomDropDown(selectedValue: $viewModel.gender, title: "Género", values: ["Masculino", "Femenino", "Otro"])
            CustomDatePicker(value: $viewModel.birthDate, title: "Fecha de nacimiento", maxDate: Calendar.current.date(byAdding: .year, value: -19, to: Date())!, minDate: Calendar.current.date(byAdding: .year, value: -100, to: Date())!)
        }
    }
}
struct SecondRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    @State var countries: [Country] = []
    @State var universities: [University] = []
    @State var selectedCountry: Country = Country()
    @State var isCountrySelected = false
    
    @Binding var isLoading: Bool
    @Binding var loadingTitle: String
    
    var body: some View {
        Form{
            Text("Datos de la institución académica")
                .padding(.leading)
            Picker(selection: $viewModel.country, label: Text("País"), content: {
                ForEach(countries, id: \.self) { value in
                    Text("\(value.nombre!)")
                        .font(.custom("Avenir Book", size: 15))
                }
            })
            .font(.custom("Avenir Book", size: 15)).padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
            .onAppear(perform: {
                isLoading.toggle()
                loadingTitle = "Cargando paises"
                let dispatch = DispatchGroup()
                
                dispatch.enter()
                viewModel.getCountries{countries in
                    self.countries = countries
                    isLoading.toggle()
                    loadingTitle = "Cargando"
                    dispatch.leave()
                }
            })
            .onChange(of: viewModel.country, perform: { value in
                isCountrySelected = true
            })
            if (isCountrySelected){
                Picker(selection: $viewModel.university, label: Text("Universidad"), content: {
                    ForEach(universities, id: \.self) { value in
                        Text("\(value.nombre!)")
                            .font(.custom("Avenir Book", size: 15))
                    }
                })
                .font(.custom("Avenir Book", size: 15)).padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .addBorder(Color.black, width: 2, cornerRadius: 20)
                .onAppear(perform: {
                    isLoading.toggle()
                    loadingTitle = "Cargando universidades"
                    let dispatch = DispatchGroup()
                    
                    dispatch.enter()
                    viewModel.getUniversityByCountry(){universities in
                        self.universities = universities
                        isLoading.toggle()
                        loadingTitle = "Cargando"
                        dispatch.leave()
                    }
                })
            }
            Spacer()
        }
    }
}
struct ThirdRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    @State var healthInstitutions: [HealthInstitution] = []
    @State var specialities: [Specialty] = []
    
    @Binding var isLoading: Bool
    @Binding var loadingTitle: String
    var body: some View {
        Form{
            Text("Datos de la unidad médica")
                .padding(.leading)
            Picker(selection: $viewModel.healthInstitution, label: Text("Institución de salud"), content: {
                ForEach(healthInstitutions, id: \.self) { value in
                    Text("\(value.nombre!)")
                        .font(.custom("Avenir Book", size: 15))
                }
            })
            .font(.custom("Avenir Book", size: 15)).padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
            .onAppear(perform: {
                isLoading.toggle()
                loadingTitle = "Cargando paises"
                let dispatch = DispatchGroup()
                
                dispatch.enter()
                viewModel.getHealtInstitutionByCountry(){institutions in
                    self.healthInstitutions = institutions
                    isLoading.toggle()
                    loadingTitle = "Cargando"
                    dispatch.leave()
                }
            })
            CustomDropDown(selectedValue: $viewModel.stayType, title: "Estancia", values: ["Internado", "Servicio Social", "Residencia"])
            if (viewModel.isResidencySelected){
                Picker(selection: $viewModel.speciality, label: Text("Especialidad"), content: {
                    ForEach(specialities, id: \.self) { value in
                        Text("\(value.nombre!)")
                            .font(.custom("Avenir Book", size: 15))
                    }
                })
                .font(.custom("Avenir Book", size: 15)).padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .addBorder(Color.black, width: 2, cornerRadius: 20)
                .onAppear(perform: {
                    isLoading.toggle()
                    loadingTitle = "Cargando especialidades"
                    let dispatch = DispatchGroup()
                    
                    dispatch.enter()
                    viewModel.getSpecialties(){specialitiesList in
                        self.specialities = specialitiesList
                        isLoading.toggle()
                        loadingTitle = "Cargando"
                        dispatch.leave()
                    }
                })
            }
            CustomDatePicker(value: $viewModel.startDate, title: "Fecha de inicio", maxDate: Calendar.current.date(byAdding: .month, value:1, to: Date())!, minDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!)
            CustomDatePicker(value: $viewModel.endDate, title: "Fecha de fin", maxDate: Calendar.current.date(byAdding: .year, value: 100, to: Date())!, minDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!)
            Spacer()
        }
    }
}
struct FourthRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        Form{
            Text("Datos de la cuenta")
            ValidatorField(value: $viewModel.username, placeholder: "Correo", keyType: .emailAddress, borderlineColor: .black)
            ValidatorSecureField(value: $viewModel.password, placeholder: "Contraseña")
            ValidatorSecureField(value: $viewModel.confirmPassword, placeholder: "Confirmar Contraseña")
            Spacer()
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterView()
                .previewDevice("iPhone 8")
            RegisterView()
        }
    }
}

struct FifthRegisterView: View {
    @State var isTermsAndConditionsAccepted = false
    @StateObject var viewModel: RegisterViewModel
    
    @Binding var isLoading: Bool
    @Binding var loadingTitle: String
    var body: some View{
        ScrollView {
            Text("Aviso de privacidad")
            CustomParagraph(title: "", content: "La Universidad Veracruzana,  con  domicilio  en  Circuito  Universitario  Gonzalo  Aguirre Beltrán S/Universitaria,  Xalapa  Enríquez,  Veracruz  con  código  Postal  91090,  es  el  responsable  del tratamiento  de  los  datos  personales  que  nos  proporcione,  los  cuales  serán  protegidos  conforme  a  lo dispuesto  por  la  Ley  316  de  Protección  de  Datos  Personales  en  Posesión  de  Sujetos  Obligados  para  el Estado de Veracruz, y demás normatividad que resulte aplicable. ")
            CustomParagraph(title: "Finalidades del tratamiento", content: "Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: realizar el registro del estudiante en el sistema de seguimiento de internos, pasantes y residentes del OBEME, fines estadísticos. \n De  manera  adicional,  utilizaremos  su  información  personal  para  las  siguientes  finalidades  que  no  son necesarias,  pero  que  nos  permiten  y  facilitan brindarle  una  mejor  atención: dar seguimiento a reportes que requieran intervención.")
            CustomParagraph(title: "Datos Personales recabados", content: "Para la finalidad antes señalada, se solicitarán los siguientes datos personales: nombre, apellidos, correo electrónico, fecha de nacimiento, género, celular. \n Se informa que no se recaban datos personales sensibles.")
            CustomParagraph(title: "Fundamento legal", content: "El fundamento para el tratamiento de datos personales y transferencia es (o son): la Ley 316 de Protección de Datos  Personales  en  Posesión  de  Sujetos  Obligados  para  el  Estado  de  Veracruz,  el  Estatuto  General  de  la Universidad Veracruzana Título VII, Capítulo III, Sección quinta, Artículo 261, fracciones IX y X.")
            CustomParagraph(title: "Transferencia de datos personales ", content: "Le  informamos  que  sus  datos  personales no son  compartidos  con  las  personas,  empresas,  organizaciones  y autoridades distintas al responsable.")
            CustomParagraph(title: "Derechos ARCO", content: "Usted tiene derecho a conocer qué datos personales se tienen de usted, para qué se utilizan y las condiciones del uso que les damos (Acceso). Asimismo, es su derecho solicitar la corrección de su información personal en caso  de  que  esté  desactualizada,  sea  inexacta  o  incompleta  (Rectificación);  que  la  eliminemos  de  nuestros registros o bases de datos cuando considere que la misma no está siendo utilizada conforme a los principios, deberes  y  obligaciones  previstas  en  la  ley  (Cancelación);  así  como  oponerse  al  uso  de  sus  datos  personales para fines específicos (Oposición). Estos derechos se conocen como derechos ARCO. Para  el  ejercicio  de  cualquiera  de  los  derechos  ARCO,  usted  podrá  presentar  solicitud  por  escrito  ante  la Coordinación   de   Transparencia, formatoo   medio   electrónico datospersonales@uv.mx,   la   que   deberá contener:")
            CustomParagraph(title: "", content: "- El nombre del titular y su domicilio o cualquier otro medio para recibir notificaciones; \n - Los documentos que acrediten la identidad del titular,  y en su caso, la personalidad e identidad de su representante; \n - De ser posible, el área responsable que trata los datos personales; \n - La descripción clara y precisa de los datos personales respecto de los que se busca ejercer alguno de los derechos ARCO, salvo que se trate del derecho de acceso; \n - La descripción del derecho ARCO que se pretende ejercer, o bien, lo que solicita el titular, y \n - Cualquier otro elemento o documento que facilite la localización de los datos personales, en su caso. ")
            CustomParagraph(title: "", content: "En caso  de solicitar  la rectificación,  adicionalmente deberá  indicar  las modificaciones a realizarse  y aportar la documentación  oficial  necesaria  que  sustente  su  petición.  En  el  derecho  de  cancelación  debe  expresar  las causas  que  motivan  la  eliminación.  Y  en  el  derecho  de  oposición  debe  señalar  los  motivos  que  justifican  se finalice  el tratamiento de los datos personales  y el daño o perjuicio que le causaría, o bien, si  la oposición es parcial,  debe  indicar  las  finalidades  específicas  con  las  que  se  no  está  de  acuerdo,  siempre  que  no  sea  un requisito obligatorio. La Coordinación de Transparencia responderá en el domicilio o medio que el titular de los datos personales designe en su solicitud, en un plazo de 15 días hábiles, que puede ser ampliado por 10 días hábiles más previa notificación. La respuesta indicará si la solicitud de acceso, rectificación, cancelación u oposición es procedente y, en su caso, hará efectivo dentro de los 15 días hábiles siguientes a la fecha en que comunique la respuesta. ")
            CustomParagraph(title: "Datos de la Unidad de Transparencia", content: "Domicilio: Calle Veracruz # 46 Depto. 5, Fracc. Pomona, C.P.91040. \n Teléfono: (228) 841-59-20, 818-78-91 \n Correo electrónico institucional: transparencia@uv.mx")
        }
        .padding(.leading)
        CustomRadioButtonField(label: "Acepto los términos y condiciones", isMarked: $isTermsAndConditionsAccepted)
            .padding()
        Button(action: {
            isLoading.toggle()
            loadingTitle = "Intentando registrar"
            let dispatch = DispatchGroup()
            
            dispatch.enter()
            viewModel.tryRegister(){value in
                isLoading.toggle()
                loadingTitle = "Cargando"
                dispatch.leave()
            }
        }, label: {
            Text("Continuar")
                .foregroundColor(.white)
                .font(.custom("Avenir Heavy", size: 15))
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }).disabled(!isTermsAndConditionsAccepted)
        .background(!isTermsAndConditionsAccepted ? Color.gray: .yellow)
        .cornerRadius(10.0)
    }
    
}
