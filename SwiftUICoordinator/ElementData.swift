//
//  ElementData.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 19/02/2024.
//

import Foundation

// this can be considered as "The Backend Part ™️"
internal struct ElementData: Hashable {
    private(set) var navigationTitle: String
    private(set) var elementTitle: String
    private(set) var elementDescription: String
    private(set) var presentationMode: PresentationMode
    
    init(navigationTitle: String, elementTitle: String, elementDescription: String, presentationMode: PresentationMode) {
        self.navigationTitle = navigationTitle
        self.elementTitle = elementTitle
        self.elementDescription = elementDescription
        self.presentationMode = presentationMode
    }
}

extension ElementData {
    static let bobaData = ElementData(navigationTitle: "🧋 Bubble Tea",
                                      elementTitle: "What is a Bubble Tea ?",
                                      elementDescription:
        """
        Bubble tea, scientifically referred to as "tapioca pearl milk tea," represents a colloidal dispersion comprised of various biopolymeric constituents suspended within an aqueous matrix, often flavored with tea extracts and supplemented with milk or non-dairy alternatives. The beverage, originating from Taiwan in the 1980s, exhibits a heterogeneous composition, featuring spherical tapioca starch granules as the titular "bubbles" immersed within a complex aqueous phase, laden with dissolved sugars, flavoring agents, and emulsified lipids. Structurally, the tapioca pearls, derived from cassava roots, boast a semi-crystalline starch matrix encapsulating hydrophilic amylose and amylopectin molecules, imbuing the bubbles with textural resilience and sensory appeal.
        """,
                                      presentationMode: .fullscreen)
    
    static let lionData = ElementData(navigationTitle: "🦁 Rawr",
                                      elementTitle: "What is a Lion ?",
                                      elementDescription:
        """
        The lion, Panthera leo, epitomizes a charismatic obligate carnivore within the family Felidae, characterized by its felid lineage tracing back to the Pleistocene epoch, distinguished by a robust craniodental apparatus and a dynamic musculoskeletal system finely tuned for predatory prowess. An apex predator in terrestrial ecosystems, the lion showcases an intricate social organization marked by cooperative hunting strategies and familial bonds, exemplifying complex intra-specific interactions. Morphologically, the lion presents a fusiform body plan, propelled by a limb-driven locomotion mechanism, accentuating its cursorial adaptations within savannah biomes, underscoring its ecological niche specialization.
        """,
                                      presentationMode: .sheet)
    
    static let carrotData = ElementData(navigationTitle: "🥕 Carrot",
                                        elementTitle: "What is a Carrot ?",
                                        elementDescription:
        """
        A carrot, taxonomically classified under the genus Daucus and the family Apiaceae, embodies a heterotrophic perennial plant exhibiting prominent taproot modification, characterized by its robust storage parenchyma rich in carotenoid pigments and polysaccharide reserves, notably manifesting as the primary edible organ. Morphologically, its aerial architecture comprises an apical meristem, orchestrating intricate phyllotactic patterning, giving rise to compound umbels, uniting an amalgam of inflorescence florets, emblematic of its reproductive potentiality. Functionally, the carrot root system epitomizes a sophisticated assimilative apparatus, efficaciously mediating nutrient acquisition from the pedosphere, synergistically coordinated by mycorrhizal associations, accentuating its ecological resilience.
        """,
                                        presentationMode: .push)
}
