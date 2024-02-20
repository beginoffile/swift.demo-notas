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
}
