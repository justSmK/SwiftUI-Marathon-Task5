//
//  ContentView.swift
//  SwiftUIMarathonTask5
//
//  Created by Sergei Semko on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var position = CGPoint(x: 200, y: 380)
    @State private var squareColor: Color = .black
    
    private let colors: [Color] = [.white, .pink, .yellow, .black]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0, content: {
                ForEach(colors, id: \.self) { color in
                    Rectangle()
                        .fill(color)
                }
            })
            
            CustomRectangle()
                .position(position)
                .gesture(
                    DragGesture()
                        .onChanged({ dragGestureValue in
                            position = dragGestureValue.location
                    })
                )
        }
    }
}

struct CustomRectangle: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 100, height: 100)
            .foregroundStyle(.white)
            .blendMode(.difference)
            .overlay(
                Group {
                    RoundedRectangle(cornerRadius: 15)
                        .blendMode(.hue)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.white).blendMode(.overlay)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.black).blendMode(.overlay)
                }
            )
    }
}

#Preview {
    ContentView()
}
