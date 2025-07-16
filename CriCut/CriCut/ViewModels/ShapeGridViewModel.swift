//
//  ShapeGridViewModel.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import Combine

///View model for the shape grid
class ShapeGridViewModel: ObservableObject {
    @Published var shapes: [Shape] = []

    private let service: ShapeServicing
    private let coordinator: AppCoordinating
    
    init(service: ShapeServicing, coordinator: AppCoordinating) {
        self.service = service
        self.coordinator = coordinator
    }
    
    /// Loads shape buttons from the api call
    /// Parses the JSON and updates the published `buttons` list
    /// Logs an error if fetching or decoding fails
    func fetchShapes() async {
        do {
            shapes = try await service.fetchShapes()
        } catch {
            print("Error loading buttons: \(error)")
        }
    }
}
