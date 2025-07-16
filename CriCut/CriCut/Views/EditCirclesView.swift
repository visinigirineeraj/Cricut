//
//  EditCirclesView.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//
import SwiftUI

struct EditCirclesView: View {
    @ObservedObject var viewModel: ShapeGridViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 12) {
                ForEach(viewModel.shapesToDraw.filter { $0.shapeType == .circle }, id: \.id) { shape in
                    shape.view
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                HStack {
                    Button(Constants.deleteAll) {
                        viewModel.shapesToDraw.removeAll(where: { $0.shapeType == .circle })
                    }
                    Spacer()
                    Button(Constants.add) {
                        viewModel.handleShapeTap(shape: .circle)
                    }
                    Spacer()
                    Button(Constants.remove) {
                        if let index = viewModel.shapesToDraw.lastIndex(where: { $0.shapeType == .circle }) {
                            viewModel.shapesToDraw.remove(at: index)
                        }
                    }
                }
            }
        }
    }
}
