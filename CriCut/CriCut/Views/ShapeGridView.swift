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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
