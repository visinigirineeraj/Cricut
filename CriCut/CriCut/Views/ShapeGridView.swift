//
//  ContentView.swift
//  CriCut
//
//  Created by Seeyon on 14/7/25.
//

import SwiftUI

struct ShapeGridView: View {
    @ObservedObject var shapeGridViewModel: ShapeGridViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
