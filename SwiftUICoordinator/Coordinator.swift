//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case index
    case ingredientList
    case description(data: ElementData)
    
    var id: Self { self }
}

enum Sheet: Hashable, Identifiable {
    case description(data: ElementData)
    
    var id: Self { self }
}

enum FullScreenCover: Hashable, Identifiable {
    case description(data: ElementData)
    
    var id: Self { self }
}

enum PresentationMode: String, Identifiable {
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
    
    func present(sheet: Sheet) {
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
        case .description(let data):
            DescriptionView(data: data)
        }
    }
    
    @ViewBuilder
    func Build(sheet: Sheet) -> some View {
        switch sheet {
        case .description(let data):
            NavigationStack {
                DescriptionView(data: data)
            }
        }
    }
    
    @ViewBuilder
    func Build(fullscreenCover: FullScreenCover) -> some View {
        switch fullscreenCover {
        case .description(let data):
            NavigationStack {
                DescriptionView(data: data)
            }
        }
    }
}
