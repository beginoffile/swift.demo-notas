//
//  Home.swift
//  DemoNotas
//
//  Created by Aguid Ramirez Sanchez on 19/02/24.
//

import SwiftUI

struct Home: View {
    @StateObject var model = ViewModel()
    @Environment(\.managedObjectContext) var context
    //@FetchRequest(entity: Notas.entity(), sortDescriptors: [NSSortDescriptor(key: "fecha", ascending: true)], animation: .spring()) var results: FetchedResults<Notas>
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [], 
                  predicate: NSPredicate(format: "fecha== %@", Date() as CVarArg),
                  animation: .spring()) var results: FetchedResults<Notas>
    var body: some View {
        NavigationView{
            List{
                ForEach(results){item in
                    VStack(alignment: .leading){
                        Text(item.nota ?? "Sin Nota")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date)
                    }.contextMenu(ContextMenu(menuItems: {
                        Button(action: {
                            model.sendData(item: item)
                        }){
                            Label(
                                title: { Text("Editar") },
                                icon: { Image(systemName: "pencil") }
                            )
                        }
                        Button(action: {
                            model.deleteData(item: item, context: context)
                        }){
                            Label(
                                title: { Text("Eliminar") },
                                icon: { Image(systemName: "trash") }
                            )
                        }
                    }))
                }
            }.navigationTitle("Notas")
                .navigationBarItems(trailing:
                                        Button(action: {
                                                model.show.toggle()
                                                }){
                                                    Image(systemName: "plus")
                                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                        .foregroundColor(.blue)
                                                }
                ).sheet(isPresented: $model.show, content: {
                    addView(model: model)
                })
        }
    }
}

#Preview {
    Home()
}
