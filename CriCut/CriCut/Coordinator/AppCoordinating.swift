//
//  AppCoordinator.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import SwiftUI

/// Protocol defining the required navigation behavior
protocol AppCoordinating {
    func start() -> AnyView
    func navigateToEditCirclesView(shapeGridViewModel: ShapeGridViewModel) -> AnyView 
}

/// The concrete coordinator handling screen navigation
final class AppCoordinator: AppCoordinating {
    private let builder: AppBuilder
    
    init(builder: AppBuilder = AppBuilder()) {
        self.builder = builder
    }
    
    func start() -> AnyView {
        AnyView(
            NavigationStack {
                AppBuilder().makeShapeGridView()
            }
        )
    }
    
    func navigateToEditCirclesView(shapeGridViewModel: ShapeGridViewModel) -> AnyView {
        AnyView(builder.makeEditCirclesView(viewModel: shapeGridViewModel))
    }
}
