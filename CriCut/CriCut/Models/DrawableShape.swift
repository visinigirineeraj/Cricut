//
//  ShapeType.swift
//  CriCut
//
//  Created by Seeyon on 16/7/25.
//

import SwiftUI

/// Enum representing shape types
enum ShapeType: String, Decodable {
    case circle, square, triangle
}

/// Struct that renders a shape based on its type
struct DrawableShape: Identifiable {
    let id = UUID()
    let shapeType: ShapeType

    var view: some View {
        switch shapeType {
        case .circle:
            return AnyView(
                Circle()
                    .fill(Color.shapeColor)
                    .frame(width: 60, height: 60)
            )
        case .square:
            return AnyView(
                Rectangle()
                    .fill(Color.shapeColor)
                    .frame(width: 60, height: 60)
            )
        case .triangle:
            return AnyView(
                Triangle()
                    .fill(Color.shapeColor)
                    .frame(width: 60, height: 60)
            )
        }
    }
}

/// Custom triangle shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
