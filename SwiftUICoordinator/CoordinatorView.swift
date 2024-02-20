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
            coordinator.Build(page: .list(id: .indexList, presentationMode: .push))
                .navigationDestination(for: BackendIdentifier.self) { identifier in
                    coordinator.Build(page: identifier)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.Build(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullscreenCover in
                    coordinator.Build(fullscreenCover: fullscreenCover)
                }
        })
        .environment(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
