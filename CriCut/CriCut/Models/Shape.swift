//
//  Shape.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import Foundation

// Supporting struct to decode the JSON structure
struct ShapeResponse: Decodable {
    let buttons: [ShapeModel]
}

/// Represents a dynamic button returned from the API
struct ShapeModel: Identifiable, Decodable {
    var id: String { name }
    let name: String
    let drawPath: ShapeType

    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
}
