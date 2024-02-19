//
//  IngredientList.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct IngredientList: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    
    var body: some View {
        ZStack() {
            List {
                Button("🥕 Carrot") {
                    coordinator?.push(.carrot)
                }
            }
            VStack {
                ViewNavFooter(presentationMode: .push)
            }
        }
        .navigationTitle("Ingredient List")
    }
}

struct IngredientListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
