//
//  SearchBar.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 8/3/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor (Color (.white))
            .frame(height: 50)
            .overlay {
                HStack(spacing: 10){
                    if text.isEmpty{
                        Image (systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    }
                    TextField("Search for a city...", text: $text)
                        .foregroundColor (.primary)
                }
                .padding(.horizontal,25)
            }
            .padding(.horizontal, 10)
    }
}

#Preview {
    SearchBar(text: .constant(""))
}
