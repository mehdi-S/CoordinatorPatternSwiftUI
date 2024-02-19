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
        Spacer()
        HStack(spacing: 16) {
            if presentationMode == .push {
                Button(role: .destructive) {
                    coordinator?.popToRoot()
                } label: {
                    Text("Pop to root")
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
                Text("Pop")
                    .frame(maxWidth: .infinity)
            }
            .tint(.blue)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.top, 16)
        .padding(.horizontal, 16)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    Group {
        ViewNavFooter(presentationMode: .push)
        ViewNavFooter(presentationMode: .sheet)
        ViewNavFooter(presentationMode: .fullscreen)
    }
}
