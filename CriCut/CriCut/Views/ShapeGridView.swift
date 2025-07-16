//
//  ContentView.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import SwiftUI

struct ShapeGridView: View {
    @ObservedObject var viewModel: ShapeGridViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))], spacing: 12) {
                    ForEach(viewModel.shapesToDraw, id: \.id) { shape in
                        shape.view
                    }
                }
            }
        }
        .navigationBarTitle("Shapes", displayMode: .inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(Constants.clearAll) {
                    viewModel.clearAll()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(Constants.editCircles) {
                    viewModel.didTapEditCircles()
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                bottomBar()
            }
        }
        .task {
            await viewModel.fetchShapes()
        }
    }
    
    @ViewBuilder
    func bottomBar() -> some View {
        HStack {
            ForEach(Array(viewModel.shapes.enumerated()), id: \.element.id) { index, shape in
                Button(shape.name) {
                    viewModel.handleShapeTap(shape: shape.drawPath)
                }
                // Add Spacer except after the last button
                if index < viewModel.shapes.count - 1 {
                    Spacer()
                }
            }
        }
    }
}
