//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

enum Page: String, Identifiable {
    case index, ingredientList, carrot
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case lion
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case boba
    
    var id: String {
        self.rawValue
    }
}

enum PresentationModes: String, Identifiable {
    case push, sheet, fullscreen
    
    var id: String {
        self.rawValue
    }
}

@Observable
class Coordinator {
    var path = NavigationPath()
    var sheet: Sheet?
    var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullscreenCover: FullScreenCover) {
        self.fullScreenCover = fullscreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullscreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func Build(page: Page) -> some View {
        switch page {
        case .index:
            IndexView()
        case .ingredientList:
            IngredientList()
        case .carrot:
            CarrotView()
        }
    }
    
    @ViewBuilder
    func Build(sheet: Sheet) -> some View {
        switch sheet {
        case .lion:
            NavigationStack {
                LionView()
            }
        }
    }
    
    @ViewBuilder
    func Build(fullscreenCover: FullScreenCover) -> some View {
        switch fullscreenCover {
        case .boba:
            NavigationStack {
                BobaView()
            }
        }
    }
}
