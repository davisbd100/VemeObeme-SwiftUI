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
    @State var isTermsAndConditionsAccepted = false
    
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            HStack{
                Button(action: {
                    if (currentTab < 1){
                        
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
            if (currentTab == 5){
                ScrollView {
                    Text("Aviso de privacidad")
                    customParagraph(title: "", content: "La Universidad Veracruzana,  con  domicilio  en  Circuito  Universitario  Gonzalo  Aguirre Beltrán S/Universitaria,  Xalapa  Enríquez,  Veracruz  con  código  Postal  91090,  es  el  responsable  del tratamiento  de  los  datos  personales  que  nos  proporcione,  los  cuales  serán  protegidos  conforme  a  lo dispuesto  por  la  Ley  316  de  Protección  de  Datos  Personales  en  Posesión  de  Sujetos  Obligados  para  el Estado de Veracruz, y demás normatividad que resulte aplicable. ")
                    customParagraph(title: "Finalidades del tratamiento", content: "Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: realizar el registro del estudiante en el sistema de seguimiento de internos, pasantes y residentes del OBEME, fines estadísticos. \n De  manera  adicional,  utilizaremos  su  información  personal  para  las  siguientes  finalidades  que  no  son necesarias,  pero  que  nos  permiten  y  facilitan brindarle  una  mejor  atención: dar seguimiento a reportes que requieran intervención.")
                    customParagraph(title: "Datos Personales recabados", content: "Para la finalidad antes señalada, se solicitarán los siguientes datos personales: nombre, apellidos, correo electrónico, fecha de nacimiento, género, celular. \n Se informa que no se recaban datos personales sensibles.")
                    customParagraph(title: "Fundamento legal", content: "El fundamento para el tratamiento de datos personales y transferencia es (o son): la Ley 316 de Protección de Datos  Personales  en  Posesión  de  Sujetos  Obligados  para  el  Estado  de  Veracruz,  el  Estatuto  General  de  la Universidad Veracruzana Título VII, Capítulo III, Sección quinta, Artículo 261, fracciones IX y X.")
                    customParagraph(title: "Transferencia de datos personales ", content: "Le  informamos  que  sus  datos  personales no son  compartidos  con  las  personas,  empresas,  organizaciones  y autoridades distintas al responsable.")
                    customParagraph(title: "Derechos ARCO", content: "Usted tiene derecho a conocer qué datos personales se tienen de usted, para qué se utilizan y las condiciones del uso que les damos (Acceso). Asimismo, es su derecho solicitar la corrección de su información personal en caso  de  que  esté  desactualizada,  sea  inexacta  o  incompleta  (Rectificación);  que  la  eliminemos  de  nuestros registros o bases de datos cuando considere que la misma no está siendo utilizada conforme a los principios, deberes  y  obligaciones  previstas  en  la  ley  (Cancelación);  así  como  oponerse  al  uso  de  sus  datos  personales para fines específicos (Oposición). Estos derechos se conocen como derechos ARCO. Para  el  ejercicio  de  cualquiera  de  los  derechos  ARCO,  usted  podrá  presentar  solicitud  por  escrito  ante  la Coordinación   de   Transparencia, formatoo   medio   electrónico datospersonales@uv.mx,   la   que   deberá contener:")
                    customParagraph(title: "", content: "- El nombre del titular y su domicilio o cualquier otro medio para recibir notificaciones; \n - Los documentos que acrediten la identidad del titular,  y en su caso, la personalidad e identidad de su representante; \n - De ser posible, el área responsable que trata los datos personales; \n - La descripción clara y precisa de los datos personales respecto de los que se busca ejercer alguno de los derechos ARCO, salvo que se trate del derecho de acceso; \n - La descripción del derecho ARCO que se pretende ejercer, o bien, lo que solicita el titular, y \n - Cualquier otro elemento o documento que facilite la localización de los datos personales, en su caso. ")
                    customParagraph(title: "", content: "En caso  de solicitar  la rectificación,  adicionalmente deberá  indicar  las modificaciones a realizarse  y aportar la documentación  oficial  necesaria  que  sustente  su  petición.  En  el  derecho  de  cancelación  debe  expresar  las causas  que  motivan  la  eliminación.  Y  en  el  derecho  de  oposición  debe  señalar  los  motivos  que  justifican  se finalice  el tratamiento de los datos personales  y el daño o perjuicio que le causaría, o bien, si  la oposición es parcial,  debe  indicar  las  finalidades  específicas  con  las  que  se  no  está  de  acuerdo,  siempre  que  no  sea  un requisito obligatorio. La Coordinación de Transparencia responderá en el domicilio o medio que el titular de los datos personales designe en su solicitud, en un plazo de 15 días hábiles, que puede ser ampliado por 10 días hábiles más previa notificación. La respuesta indicará si la solicitud de acceso, rectificación, cancelación u oposición es procedente y, en su caso, hará efectivo dentro de los 15 días hábiles siguientes a la fecha en que comunique la respuesta. ")
                    customParagraph(title: "Datos de la Unidad de Transparencia", content: "Domicilio: Calle Veracruz # 46 Depto. 5, Fracc. Pomona, C.P.91040. \n Teléfono: (228) 841-59-20, 818-78-91 \n Correo electrónico institucional: transparencia@uv.mx")
                }
                RadioButtonField(label: "Acepto los términos y condiciones", isMarked: $isTermsAndConditionsAccepted)
                    .padding()
                Button(action: {
                    
                }, label: {
                    Text("Continuar")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Heavy", size: 15))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }).disabled(!isTermsAndConditionsAccepted)
                .background(!isTermsAndConditionsAccepted ? Color.gray: .yellow)
                .cornerRadius(10.0)
            }else{
                TabView(selection: $currentTab,
                        content:  {
                            FirstRegisterView(viewModel: viewModel)
                                .tag(1)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                            SecondRegisterView(viewModel: viewModel)
                                .tag(2)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                            ThirdRegisterView(viewModel: viewModel)
                                .tag(3)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                            FourthRegisterView(viewModel: viewModel)
                                .tag(4)
                                .gesture(isSwipeDisabled ? DragGesture() : nil)
                        })
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                Button(action: {
                    currentTab += 1
                }, label: {
                    Text("Siguiente")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Heavy", size: 15))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .background(Color.blue)
                .cornerRadius(10.0)
            }

        })
    }
}


struct FirstRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Text("Datos Personales")
                    .padding(.leading)
                customDropDown(selectedValue: $viewModel.gender, values: ["Masculino", "Femenino", "Otro"])
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                customDatePicker(value: $viewModel.birthDate, title: "Fecha de nacimiento", maxDate: Calendar.current.date(byAdding: .year, value: -19, to: Date())!, minDate: Calendar.current.date(byAdding: .year, value: -100, to: Date())!)
                Spacer()
            }
        }
    }
}
struct SecondRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Datos de la institución académica")
                .padding(.leading)
            customDropDown(selectedValue: $viewModel.country, values: ["UV1", "UV2", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3"])
            customDropDown(selectedValue: $viewModel.university, values: ["UV1", "UV2", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3"])
            Spacer()
        }
    }
}
struct ThirdRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Datos de la institución académica")
                .padding(.leading)
            customDropDown(selectedValue: $viewModel.healthInstitution, values: ["UV1", "UV2", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3"])
            customDropDown(selectedValue: $viewModel.stayType, values: ["UV1", "UV2", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3"])
            customDropDown(selectedValue: $viewModel.especiality, values: ["UV1", "UV2", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3", "UV3"])
            customDatePicker(value: $viewModel.startDate, title: "Fecha de inicio", maxDate: Calendar.current.date(byAdding: .month, value:1, to: Date())!, minDate: Calendar.current.date(byAdding: .month, value: -6, to: Date())!)
            customDatePicker(value: $viewModel.endDate, title: "Fecha de fin", maxDate: Calendar.current.date(byAdding: .year, value: 100, to: Date())!, minDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!)
            Spacer()
        }
    }
}
struct FourthRegisterView: View {
    @StateObject var viewModel: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            ValidatorField(value: $viewModel.username, placeholder: "Correo", keyType: .emailAddress, borderlineColor: .black)
            ValidatorSecureField(value: $viewModel.password, placeholder: "Contraseña")
            ValidatorSecureField(value: $viewModel.confirmPassword, placeholder: "Confirmar Contraseña")
            Spacer()
        }
    }
}

struct RadioButtonField: View {
    let label: String
    @Binding var isMarked:Bool
    
    var body: some View {
        Button(action:{
            isMarked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                Text(label)
                    .font(Font.system(size: 15))
                Spacer()
            }.foregroundColor(Color.black)
        }
        .foregroundColor(Color.white)
    }
}
struct customDatePicker: View {
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
                            .labelsHidden()
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

struct customDropDown: View {
    @Binding var selectedValue : String
    var values: [String]
    @State var isExpanded = false
    
    var body: some View{
        VStack{
            DisclosureGroup("\(selectedValue)", isExpanded: $isExpanded){
                ScrollView {
                    VStack {
                        ForEach(values, id: \.self) { value in
                            Text("\(value)")
                                .font(.custom("Avenir Book", size: 15))
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedValue = value
                                    withAnimation{
                                        self.isExpanded.toggle()
                                    }
                                }
                        }
                    }
                }.frame(height:170)
            }
            .onTapGesture {
                withAnimation{
                    self.isExpanded.toggle()
                }
            }
            .font(.custom("Avenir Book", size: 15)).padding()
            .background(Color.white)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
        }
    }
}
struct customParagraph: View {
    var title: String
    var content: String
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(title)")
                .font(.custom("Avenir Medium", size: 14))
            Text("\(content) \n")
                .font(.custom("Avenir Book", size: 14))
                .multilineTextAlignment(.leading)
        }
    }
}
extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
