//
//  AppBuilder.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import SwiftUI

/// Abstracts the creation of views
protocol AppBuilding {
    func makeShapeGridView() -> AnyView
}


/// Concerte Builder for constructing views
struct AppBuilder: AppBuilding {
    func makeShapeGridView() -> AnyView {
        let network: NetworkManager = NetworkManager()
        let service: ShapeService = ShapeService(network: network)
        let coordinator: AppCoordinator = AppCoordinator()
        let viewModel: ShapeGridViewModel = ShapeGridViewModel(service: service, coordinator: coordinator)
        return AnyView(ShapeGridView(viewModel: viewModel))
    }
}
