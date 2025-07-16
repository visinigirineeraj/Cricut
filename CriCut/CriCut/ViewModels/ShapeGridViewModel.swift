//
//  ShapeGridViewModel.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import Combine

///View model for the shape grid
class ShapeGridViewModel: ObservableObject {
    @Published var shapes: [ShapeModel] = []
    @Published var shapesToDraw: [DrawableShape] = []
    @Published var isNavigatingToEdit: Bool = false

    private let service: ShapeServicing
    private let coordinator: AppCoordinating
    

    init(service: ShapeServicing, coordinator: AppCoordinating) {
        self.service = service
        self.coordinator = coordinator
    }
}
// MARK: - Functional Methods

extension ShapeGridViewModel {

    /// Clears all shapes from the grid view
    /// This resets the `shapesToDraw` array to an empty list
    func clearAll() {
        shapesToDraw.removeAll()
    }

    func didTapEditCircles() {
//        editCirclesDestination = coordinator.navigateToEditCirclesView(sharedViewModel: self)
        isNavigatingToEdit = true
    }
    
    /// Appends a new shape to the grid
    func handleShapeTap(shape: ShapeType) {
        shapesToDraw.append(DrawableShape(shapeType: shape))
    }
}


// MARK: - API Methods
extension ShapeGridViewModel {
    /// Loads shape buttons from the api call
    /// Parses the JSON and updates the published `buttons` list
    /// Logs an error if fetching or decoding fails
    @MainActor
    func fetchShapes() async {
        do {
            shapes = try await service.fetchShapes()
        } catch {
            print("Error loading buttons: \(error)")
        }
    }
}
