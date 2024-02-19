//
//  DescriptionView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct DescriptionView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var navTitle: String
    private var viewDesc: String
    private var viewTitle: String
    private var presentationMode: PresentationMode
    
    init(data: ElementData) {
        self.navTitle = data.navigationTitle
        self.viewTitle = data.elementTitle
        self.viewDesc = data.elementDescription
        self.presentationMode = data.presentationMode
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewTitle)
                    .font(.title)
                    .fontWeight(.bold)
                Text(viewDesc)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: presentationMode)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(navTitle)
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(data: ElementData(navigationTitle: "🤖 my nav title",
                                          elementTitle: "Very interesting description",
                                          elementDescription: "A somewhat nice title !",
                                          presentationMode: .push))
    }
}
