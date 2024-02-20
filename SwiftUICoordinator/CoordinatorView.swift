//
//  CoordinatorView.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @State private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path, root: {
            coordinator.Build(page: PageData(pageId: .indexList, presentation: .push, type: .list))
                .navigationDestination(for: PageData.self) { pageData in
                    coordinator.Build(page: pageData)
                }
                .sheet(item: $coordinator.sheet) { pageData in
                    coordinator.Build(sheet: pageData)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { pageData in
                    coordinator.Build(fullscreenCover: pageData)
                }
        })
        .environment(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
