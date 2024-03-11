//
//  SuperScrollView.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 1/3/24.
//

import SwiftUI

struct SuperScrollView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach (MockData.items) { items
                    
                    in Circle()
                        .containerRelativeFrame(.horizontal,
                                                count: verticalSizeClass == .regular ? 1 : 4,
                                                spacing: 16)
                        .foregroundStyle(items.color.gradient)
                        .scrollTransition { content, phase in content
                                .opacity(phase.isIdentity ? 1.0 : 0.5)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
                
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}



struct Items: Identifiable {
    let id = UUID()
    let color: Color
}
struct MockData {
    static var items = [Items(color: .teal),
                        Items(color: .pink),
                        Items(color: .indigo),
                        Items(color: .orange),
                        Items(color: .purple),
                        Items(color: .yellow),
                        Items(color: .green),
                        Items(color: .blue),
                        Items(color: .brown),
                        Items(color: .red)]
}

#Preview {
    SuperScrollView()
}
