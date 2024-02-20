//
//  Backend.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 19/02/2024.
//

import SwiftUI


// MARK: BACKEND KNOWLEDGE

/// this can be considered as "The Backend Part ™️" each ID representing an URL
/// the next structure and enums represent backend knowledge, with `PageID` replacing common URLs to load elements
/// `PageType` and `PresentationMode` could be considered as Database information related to page object on the server side
struct PageData: Identifiable, Hashable {
    private(set) var pageId: PageID
    private(set) var presentation: PresentationMode
    private(set) var type: PageType
    
    var id: Self { self }
}

enum PageID {
    case bobaDetails, lionDetails, carrotDetails, emptyDetails, indexList, ingredientList, emptyList
}

enum PageType {
    case detail, list
}

enum PresentationMode {
    case push, sheet, fullscreen
}

// MARK: API CALLS

/// Those are the 2 api route that can be called by what serves as a controller, viewModel, etc to give the View
/// the data it needs to render
func backendGetDetailDataFromID(pageIdentifier id: PageID) -> DetailData? {
    /// This variable represent the database knowledge simplified as we expect database to
    /// always return Data type according to the call that has been made
    let dataBase: [DetailData] = [DetailData.lionData, DetailData.carrotData, DetailData.bobaData]
    return dataBase.first { $0.pageIdentifier == id }
}

func backendGetListDataFromID(pageIdentifier id: PageID) -> ListData? {
    /// This variable represent the database knowledge simplified as we expect database to
    /// always return Data type according to the call that has been made
    let dataBase: [ListData] = [ListData.indexList, ListData.ingredientList]
    return dataBase.first { $0.pageIdentifier == id }
}

// MARK: DTO

/// Here is the real meat, those 2 object would be also defined in the fronted in a real life application
/// and represent the DTOs for which backend needs us to be aware of.
struct ListData {
    private(set) var pageIdentifier: PageID
    private(set) var navigationTitle: String
    private(set) var content: [ListElement]
    
    struct ListElement: Identifiable, Hashable {
        private(set) var section: Section?
        private(set) var button: Button
        
        var id: Self { self }
    }
    
    struct Section: Hashable {
        private(set) var title: String
        private(set) var prominence: Prominence
    }
    
    struct Button: Hashable {
        private(set) var title: String
        private(set) var accessory: Accessory?
        private(set) var pageData: PageData
    }
    
    struct Accessory: Hashable {
        private(set) var title: String
        private(set) var imageIdentifier: String
    }
}


struct DetailData {
    private(set) var pageIdentifier: PageID
    private(set) var navigationTitle: String
    private(set) var title: String
    private(set) var description: String
}

// MARK: Data definition

/// Those statics represent the backend data knowledge per se. Empty element should not be present here idealy,
/// concerned views should be able to display an `EmptyView` component in case of backend failing to
/// retrieve data or network call ending up failing
extension DetailData {
    static let emptyData = DetailData(pageIdentifier: .emptyDetails,
                                      navigationTitle: "such Empty",
                                      title: "nothing",
                                      description: "again, nothing")
    static let bobaData = DetailData(pageIdentifier: .bobaDetails,
                                     navigationTitle: "🧋 Bubble Tea",
                                     title: "What is a Bubble Tea ?",
                                     description:
        """
        Bubble tea, scientifically referred to as "tapioca pearl milk tea," represents a colloidal dispersion comprised of various biopolymeric constituents suspended within an aqueous matrix, often flavored with tea extracts and supplemented with milk or non-dairy alternatives. The beverage, originating from Taiwan in the 1980s, exhibits a heterogeneous composition, featuring spherical tapioca starch granules as the titular "bubbles" immersed within a complex aqueous phase, laden with dissolved sugars, flavoring agents, and emulsified lipids. Structurally, the tapioca pearls, derived from cassava roots, boast a semi-crystalline starch matrix encapsulating hydrophilic amylose and amylopectin molecules, imbuing the bubbles with textural resilience and sensory appeal.
        """)
    
    static let lionData = DetailData(pageIdentifier: .lionDetails,
                                     navigationTitle: "🦁 Rawr",
                                     title: "What is a Lion ?",
                                     description:
        """
        The lion, Panthera leo, epitomizes a charismatic obligate carnivore within the family Felidae, characterized by its felid lineage tracing back to the Pleistocene epoch, distinguished by a robust craniodental apparatus and a dynamic musculoskeletal system finely tuned for predatory prowess. An apex predator in terrestrial ecosystems, the lion showcases an intricate social organization marked by cooperative hunting strategies and familial bonds, exemplifying complex intra-specific interactions. Morphologically, the lion presents a fusiform body plan, propelled by a limb-driven locomotion mechanism, accentuating its cursorial adaptations within savannah biomes, underscoring its ecological niche specialization.
        """)
    
    static let carrotData = DetailData(pageIdentifier: .carrotDetails,
                                       navigationTitle: "🥕 Carrot",
                                       title: "What is a Carrot ?",
                                       description:
        """
        A carrot, taxonomically classified under the genus Daucus and the family Apiaceae, embodies a heterotrophic perennial plant exhibiting prominent taproot modification, characterized by its robust storage parenchyma rich in carotenoid pigments and polysaccharide reserves, notably manifesting as the primary edible organ. Morphologically, its aerial architecture comprises an apical meristem, orchestrating intricate phyllotactic patterning, giving rise to compound umbels, uniting an amalgam of inflorescence florets, emblematic of its reproductive potentiality. Functionally, the carrot root system epitomizes a sophisticated assimilative apparatus, efficaciously mediating nutrient acquisition from the pedosphere, synergistically coordinated by mycorrhizal associations, accentuating its ecological resilience.
        """)
}

extension ListData {
    static let emptyList = ListData(pageIdentifier: .emptyList, navigationTitle: "Such Empty", content: [])
    static let indexList = ListData(pageIdentifier: .indexList,
                                    navigationTitle: "Index", content: [
                                        ListData.ListElement(section: ListData.Section(title: "Foods",
                                                                                       prominence: .increased),
                                                             button: ListData.Button(title: "🥗 Salads Ingredients",
                                                                                     accessory: ListData.Accessory(title: "Push",
                                                                                                                   imageIdentifier: "arrow.right.circle"),
                                                                                     pageData: PageData(pageId: .ingredientList, 
                                                                                                        presentation: .push,
                                                                                                        type: .list))),
                                        ListData.ListElement(section: ListData.Section(title: "Animals",
                                                                                       prominence: .increased),
                                                             button: ListData.Button(title: "🦁 Lion",
                                                                                     accessory: ListData.Accessory(title: "Sheet",
                                                                                                                   imageIdentifier: "arrow.up.right.bottomleft.rectangle"),
                                                                                     pageData: PageData(pageId: .lionDetails, 
                                                                                                        presentation: .sheet,
                                                                                                        type: .detail))),
                                        ListData.ListElement(section: ListData.Section(title: "Drinks",
                                                                                       prominence: .increased),
                                                             button: ListData.Button(title: "🧋 Bubble Tea",
                                                                                     accessory: ListData.Accessory(title: "Fullscreen",
                                                                                                                   imageIdentifier: "arrow.down.left.and.arrow.up.right.square"),
                                                                                     pageData: PageData(pageId: .bobaDetails, 
                                                                                                        presentation: .fullscreen,
                                                                                                        type: .detail)))
                                    ])
    
    static let ingredientList = ListData(pageIdentifier: .ingredientList,
                                         navigationTitle: "Ingredient List", content: [
        ListData.ListElement(button: ListData.Button(title: "🥕 Carrot",
                                                     accessory: ListData.Accessory(title: "Push",
                                                                                   imageIdentifier: "arrow.right.circle"),
                                                     pageData: PageData(pageId: .carrotDetails,
                                                                        presentation: .push,
                                                                        type: .detail)))
    ])
}
