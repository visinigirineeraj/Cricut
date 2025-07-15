//
//  Service.swift
//  CriCut
//
//  Created by Seeyon on 15/7/25.
//

import Foundation

/// Abstract protocol for shape fetching service
protocol ShapeServicing {
    func fetchShapes() async throws -> [Shape]
}

/// Service layer which delegates API call to the network layer
class ShapeService: ShapeServicing {
    private let network: Networking

    init(network: Networking) {
        self.network = network
    }
    
    func fetchShapes() async throws -> [Shape] {
        guard let url = URL(string: Constants.baseURLString) else {
            throw CricutError.inValidURL
        }
    }
}
