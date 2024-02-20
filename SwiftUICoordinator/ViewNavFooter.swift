//
//  ViewNavFooter.swift
//  SwiftUICoordinator
//
//  Created by Mehdi Silini on 18/02/2024.
//

import SwiftUI

struct ViewNavFooter: View {
    
    @Environment(Coordinator.self) private var coordinator: Coordinator?
    var presentationMode: PresentationMode
    
    init(presentationMode: PresentationMode) {
        self.presentationMode = presentationMode
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
                HStack(spacing: 16) {
                    if presentationMode == .push {
                        Button(role: .destructive) {
                            coordinator?.popToRoot()
                        } label: {
                            Text("Return to index")
                                .frame(maxWidth: .infinity)
                        }
                        .tint(.red)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                    }
                    Button(role: .cancel) {
                        switch presentationMode {
                        case .push:
                            coordinator?.pop()
                        case .sheet:
                            coordinator?.dismissSheet()
                        case .fullscreen:
                            coordinator?.dismissFullscreenCover()
                        }
                    } label: {
                        Text("Close")
                            .frame(maxWidth: .infinity)
                    }
                    .tint(.blue)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                }
                .padding(.top, 16)
                .padding(.horizontal, 16)
            }
            .fixedSize(horizontal: false, vertical: true)
            .background(.ultraThinMaterial)
        }
        .padding(.top, -8)
    }
}

#Preview {
    Group {
        ViewNavFooter(presentationMode: .push)
        ViewNavFooter(presentationMode: .sheet)
        ViewNavFooter(presentationMode: .fullscreen)
    }
}
