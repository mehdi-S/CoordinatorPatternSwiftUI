//
//  IndexView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct IndexView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    
    var body: some View {
        List {
            Section("Foods") {
                Button(action: {
                    coordinator?.push(.ingredientList)
                }, label: {
                    HStack {
                        Text("🥗 Salads Ingredients")
                            .foregroundStyle(Color.black)
                        Spacer()
                        HStack {
                            Text("Push")
                            Image(systemName: "arrow.right.circle")
                        }
                    }
                })
            }.headerProminence(.increased)
            Section("Animals") {
                Button(action: {
                    coordinator?.presentSheet(.lion)
                }, label: {
                    HStack {
                        Text("🦁 Lion")
                            .foregroundStyle(Color.black)
                        Spacer()
                        HStack {
                            Text("Sheet")
                            Image(systemName: "arrow.up.right.bottomleft.rectangle")
                        }
                    }
                })
            }.headerProminence(.increased)
            Section("Drinks") {
                Button(action: {
                    coordinator?.present(fullscreenCover: .boba)
                }, label: {
                    HStack {
                        Text("🧋 Bubble Tea")
                            .foregroundStyle(Color.black)
                        Spacer()
                        HStack {
                            Text("Fullscreen")
                            Image(systemName: "arrow.down.left.and.arrow.up.right.square")
                        }
                    }
                })
            }.headerProminence(.increased)
        }
        .navigationTitle("Index")
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
