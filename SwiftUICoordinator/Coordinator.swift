//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

enum Page: Hashable, Identifiable {
    case list(data: ListData)
    case description(data: DetailData, presentationMode: PresentationMode)
    
    var id: Self { self }
}

enum Sheet: Hashable, Identifiable {
    case description(data: DetailData)
    
    var id: Self { self }
}

enum FullScreenCover: Hashable, Identifiable {
    case description(data: DetailData)
    
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
    var sheet: BackendIdentifier?
    var fullScreenCover: BackendIdentifier?
    
    func push(page id: BackendIdentifier) {
        path.append(id)
    }
    
    func present(sheet id: BackendIdentifier) {
        self.sheet = id
    }
    
    func present(fullscreenCover id: BackendIdentifier) {
        self.fullScreenCover = id
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
    func Build(page id: BackendIdentifier) -> some View {
        switch id {
        case .detail(let id, let presentationMode):
            DescriptionView(id: id, presentationMode: presentationMode)
        case .list(let id, let presentationMode):
            ListView(id: id)
        }
    }
    
    @ViewBuilder
    func Build(sheet id: BackendIdentifier) -> some View {
        switch id {
        case .detail(let id, let presentationMode):
            NavigationStack {
                DescriptionView(id: id, presentationMode: presentationMode)
            }
        case .list(let id, let presentationMode):
            NavigationStack {
                ListView(id: id)
            }
        }
    }
    
    @ViewBuilder
    func Build(fullscreenCover id: BackendIdentifier) -> some View {
        switch id {
        case .detail(let id, let presentationMode):
            NavigationStack {
                DescriptionView(id: id, presentationMode: presentationMode)
            }
        case .list(let id, let presentationMode):
            NavigationStack {
                ListView(id: id)
            }
        }
    }
}
