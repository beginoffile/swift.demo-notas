//
//  addView.swift
//  DemoNotas
//
//  Created by Aguid Ramirez Sanchez on 19/02/24.
//

import SwiftUI

struct addView: View {
    @ObservedObject var model : ViewModel
    @Environment(\.managedObjectContext) var context
    var body: some View {
        VStack{
            Text(model.updateItem != nil ? "Editar Nota" : "Agregar Nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar Fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                if model.updateItem != nil{
                    model.editData(context: context)
                }else{
                    model.saveData(context: context)
                }
               
            }){
                Label(
                    title: { Text("Guardar").foregroundColor(.white).bold() },
                    icon: { Image(systemName: "plus").foregroundColor(.white) }
                )
            }.padding()
             .frame(width: UIScreen.main.bounds.width-70)
             .background(model.nota=="" ? Color.gray : Color.blue)
             .cornerRadius(8)
             .disabled(model.nota=="")
        }.padding()
         
         .onDisappear{
            //model.updateItem = nil
             model.resetData()
         }
            
            
    }
    
    
}


/*
 #Preview {
 @StateObject var model = ViewModel()
 addView(model: model)
 }
 */
