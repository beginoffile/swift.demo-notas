//
//  ViewModel.swift
//  DemoNotas
//
//  Created by Aguid Ramirez Sanchez on 19/02/24.
//

import Foundation
import CoreData
import SwiftUI


class ViewModel:ObservableObject{
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    public var updateItem : Notas!
    
    //CoreData
    func saveData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.nota = nota
        newNota.fecha = fecha
        
        do{
            try context.save()
            print("guardo")
            show.toggle()
            }catch let error as NSError{
                print("No guardo", error.localizedDescription)
            }
    }
    
    func deleteData(item: Notas,context:NSManagedObjectContext){
        context.delete(item)
        do{
            try context.save()
            print("elimino")
            }catch let error as NSError{
                print("No elimino", error.localizedDescription)
            }
    }
    
    func sendData(item: Notas){
        updateItem = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.fecha = fecha
        updateItem.nota = nota
        do{
            try context.save()
            print("edito")
            show.toggle()
        }catch let error as NSError{
            print("No edito", error.localizedDescription)
        }
        
    }
    
    func resetData(){
        nota=""
        fecha=Date()
        updateItem=nil
    }
}
