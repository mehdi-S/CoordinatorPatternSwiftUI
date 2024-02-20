//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

@Observable
class Coordinator {
    var path = NavigationPath()
    var sheet: PageData?
    var fullScreenCover: PageData?
    
    func push(page data: PageData) {
        path.append(data)
    }
    
    func present(sheet data: PageData) {
        self.sheet = data
    }
    
    func present(fullscreenCover data: PageData) {
        self.fullScreenCover = data
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
    func Build(page data: PageData) -> some View {
        switch data.type {
        case .detail:
            DetailsView(id: data.pageId, presentationMode: data.presentation)
        case .list:
            ListView(id: data.pageId)
        }
    }
    
    @ViewBuilder
    func Build(sheet data: PageData) -> some View {
        switch data.type {
        case .detail:
            NavigationStack {
                DetailsView(id: data.pageId, presentationMode: data.presentation)
            }
        case .list:
            NavigationStack {
                ListView(id: data.pageId)
            }
        }
    }
    
    @ViewBuilder
    func Build(fullscreenCover data: PageData) -> some View {
        switch data.type {
        case .detail:
            NavigationStack {
                DetailsView(id: data.pageId, presentationMode: data.presentation)
            }
        case .list:
            NavigationStack {
                ListView(id: data.pageId)
            }
        }
    }
}
