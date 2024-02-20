//
//  ListView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct ListView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var listData: ListData
    
    init(id: BackendListIdentifier) {
        self.listData = backendGetListDataFromID(backendIdentifier: id) ?? ListData.emptyList
    }
    
    @ViewBuilder
    func makeButton(buttonData: ListData.Button) -> some View {
        Button(action: {
            switch buttonData.identifier {
            case .detail(let id, let presentationMode):
                switch presentationMode {
                case .push:
                    coordinator?.push(page: id)
                case .sheet:
                    <#code#>
                case .fullscreen:
                    <#code#>
                }
            case .list(let id, let presentationMode):
                switch presentationMode {
                case .push:
                    coordinator?.push(buttonData.identifier)
                case .sheet:
                    <#code#>
                case .fullscreen:
                    <#code#>
                }
            }
        }, label: {
            HStack {
                Text(buttonData.title)
                    .foregroundStyle(Color.black)
                Spacer()
                if let accessory = buttonData.accessory {
                    HStack {
                        Text(accessory.title)
                        Image(systemName: accessory.imageIdentifier)
                    }
                }
            }
        })
    }
    
    var body: some View {
        List {
            ForEach(listData.content) { data in
                if let section = data.section {
                    Section(section.title) {
                        makeButton(buttonData: data.button)
                    }.headerProminence(section.prominence)
                } else {
                    makeButton(buttonData: data.button)
                }
            }
        }.navigationTitle(listData.navigationTitle)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(id: .indexList)
    }
}
