//
//  AppBuilder.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import SwiftUI

/// Abstracts the creation of views
protocol AppBuilding {
    func makeShapeGridView() -> some View
}


/// Concerte Builder for constructing views
struct AppBuilder: AppBuilding {
    func makeShapeGridView() -> some View {
        let viewModel: ShapeGridViewModel = .init()
        ShapeGridView(shapeGridViewModel: viewModel)
    }
}
