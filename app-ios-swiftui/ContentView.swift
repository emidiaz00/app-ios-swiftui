//
//  ContentView.swift
//  app-ios-swiftui
//
//  Created by Emiliano Diaz on 24/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert : Bool = false
    @State private var showActionSheet : Bool = false
    
    var alert: Alert {
        Alert(title: Text("Alerta"), message: Text("Soy una alerta"), dismissButton:
                .default(Text("Aceptar"),
                         action: {
            print("Es mi primer accion")
        }))
    }
    
    var action: ActionSheet {
        ActionSheet(title: Text("Action sheet"), message: Text("Selecciona una opcion"), buttons: [
            .default(Text("Galeria")),
            .default(Text("Camara")),
            .cancel(Text("Cancelar"))
        ])
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Text("Curso SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.indigo)
                .bold()
            Text("Bienvenidos al curso")
                .font(.callout)
                .bold()
                .foregroundColor(.gray)
            
            Image("SwiftUI")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(40)
            
            HStack(alignment: .center, spacing: 10) {
                Button(action: {
                    self.showAlert.toggle()
                }){
                    HStack{
                        Image(systemName: "rectangle.grid.1x2.fill")
                            .foregroundColor(.white)
                        Text("Alert")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                    }.padding(.all)
                }.background(Color.indigo)
                    .cornerRadius(12)
                    .alert(isPresented: self.$showAlert) { () -> Alert in
                        self.alert
                    }
                
                Button(action: {
                    self.showActionSheet.toggle()
                }){
                    HStack{
                        Image(systemName: "folder.fill")
                            .foregroundColor(.white)
                        Text("Action Sheet")
                            .foregroundColor(.white)
                            .bold()
                            .font(.headline)
                    }.padding(.all)
                }.background(Color.red)
                    .cornerRadius(12)
                    .actionSheet(isPresented: self.$showActionSheet) { () -> ActionSheet in self.action
                    }
            }
            Spacer()
        }.padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
