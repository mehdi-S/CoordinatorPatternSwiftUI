//
//  DetailsView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct DetailsView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var data: DetailData
    private var presentationMode: PresentationMode
    
    init(id: PageID, presentationMode: PresentationMode) {
        self.data = backendGetDetailDataFromID(pageIdentifier: id) ?? DetailData.emptyData
        self.presentationMode = presentationMode
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(data.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(data.description)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: presentationMode)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(data.navigationTitle)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(id: .bobaDetails, presentationMode: .push)
    }
}
