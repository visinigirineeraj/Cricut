//
//  Service.swift
//  CriCut
//
//  Created by Seeyon on 15/7/25.
//

import Foundation

/// Abstract protocol for shape fetching service
protocol ShapeServicing {
    func fetchShapes() async throws -> [ShapeModel]
}

/// Service layer which delegates API call to the network layer
class ShapeService: ShapeServicing {
    private let network: Network

    init(network: Network) {
        self.network = network
    }
    
    func fetchShapes() async throws -> [ShapeModel] {
        guard let url = URL(string: Constants.baseURLString) else {
            throw CricutError.inValidURL
        }
        let data = try await network.fetch(from: url)
        let model = try JSONDecoder().decode(ShapeResponse.self, from: data)
        return model.buttons
    }
}
