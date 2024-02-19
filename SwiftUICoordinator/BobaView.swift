//
//  BobaView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct BobaView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var BobaDesc: String =
    """
    Bubble tea, scientifically referred to as "tapioca pearl milk tea," represents a colloidal dispersion comprised of various biopolymeric constituents suspended within an aqueous matrix, often flavored with tea extracts and supplemented with milk or non-dairy alternatives. The beverage, originating from Taiwan in the 1980s, exhibits a heterogeneous composition, featuring spherical tapioca starch granules as the titular "bubbles" immersed within a complex aqueous phase, laden with dissolved sugars, flavoring agents, and emulsified lipids. Structurally, the tapioca pearls, derived from cassava roots, boast a semi-crystalline starch matrix encapsulating hydrophilic amylose and amylopectin molecules, imbuing the bubbles with textural resilience and sensory appeal.
    """
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("What is a Bubble Tea ?")
                    .font(.title)
                    .fontWeight(.bold)
                Text(BobaDesc)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: .fullscreen)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("🧋 Bubble Tea")
    }
}

struct BobaView_Previews: PreviewProvider {
    static var previews: some View {
        BobaView()
    }
}
