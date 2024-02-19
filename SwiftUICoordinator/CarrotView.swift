//
//  CarrotView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct CarrotView: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    private var carrotDesc: String =
    """
    A carrot, taxonomically classified under the genus Daucus and the family Apiaceae, embodies a heterotrophic perennial plant exhibiting prominent taproot modification, characterized by its robust storage parenchyma rich in carotenoid pigments and polysaccharide reserves, notably manifesting as the primary edible organ. Morphologically, its aerial architecture comprises an apical meristem, orchestrating intricate phyllotactic patterning, giving rise to compound umbels, uniting an amalgam of inflorescence florets, emblematic of its reproductive potentiality. Functionally, the carrot root system epitomizes a sophisticated assimilative apparatus, efficaciously mediating nutrient acquisition from the pedosphere, synergistically coordinated by mycorrhizal associations, accentuating its ecological resilience.
    """
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("What is a Carrot ?")
                    .font(.title)
                    .fontWeight(.bold)
                Text(carrotDesc)
                    .font(.body)
            }.padding()
            ViewNavFooter(presentationMode: .push)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("🥕 Carrot")
    }
}

struct CarrotView_Previews: PreviewProvider {
    static var previews: some View {
        CarrotView()
    }
}
