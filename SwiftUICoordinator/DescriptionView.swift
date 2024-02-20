//
//  DescriptionView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct DescriptionView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var data: DetailData
    private var presentationMode: PresentationMode
    
    init(id: BackendDetailIdentifier, presentationMode: PresentationMode) {
        self.data = backendGetDetailDataFromID(backendIdentifier: id) ?? DetailData.emptyData
        self.presentationMode = presentationMode
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(data.elementTitle)
                    .font(.title)
                    .fontWeight(.bold)
                Text(data.elementDescription)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: presentationMode)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(data.navigationTitle)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(id: .bobaDetails, presentationMode: .push)
    }
}
