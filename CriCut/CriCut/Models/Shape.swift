//
//  Shape.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import Foundation

/// Enum representing shape types
enum ShapeType: String, Decodable {
    case circle, square, triangle
}

/// Represents a dynamic button returned from the API
struct Shape: Identifiable, Decodable {
    var id: String { name }
    let name: String
    let drawPath: ShapeType

    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
}
