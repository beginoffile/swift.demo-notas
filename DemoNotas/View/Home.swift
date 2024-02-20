//
//  Home.swift
//  DemoNotas
//
//  Created by Aguid Ramirez Sanchez on 19/02/24.
//

import SwiftUI

struct Home: View {
    @StateObject var model = ViewModel()
    var body: some View {
        Button(action: {
            model.show.toggle()
        }){
            Text("+")
        }.sheet(isPresented: $model.show, content: {
            addView(model: model)
        })
    }
}

#Preview {
    Home()
}
