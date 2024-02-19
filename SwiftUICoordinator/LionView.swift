//
//  LionView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct LionView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var lionDesc: String =
    """
    The lion, Panthera leo, epitomizes a charismatic obligate carnivore within the family Felidae, characterized by its felid lineage tracing back to the Pleistocene epoch, distinguished by a robust craniodental apparatus and a dynamic musculoskeletal system finely tuned for predatory prowess. An apex predator in terrestrial ecosystems, the lion showcases an intricate social organization marked by cooperative hunting strategies and familial bonds, exemplifying complex intra-specific interactions. Morphologically, the lion presents a fusiform body plan, propelled by a limb-driven locomotion mechanism, accentuating its cursorial adaptations within savannah biomes, underscoring its ecological niche specialization.
    """
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("What is a Lion ?")
                    .font(.title)
                    .fontWeight(.bold)
                Text(lionDesc)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: .sheet)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("🦁 Rawr")
    }
}

struct LionView_Previews: PreviewProvider {
    static var previews: some View {
        LionView()
    }
}
