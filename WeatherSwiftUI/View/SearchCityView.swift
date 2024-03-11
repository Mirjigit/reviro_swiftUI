//
//  Search.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 8/3/24.
//

import SwiftUI

struct SearchCityView: View {
    let cities = ["Hong Kong", "Beijing", "Delhi", "Chennai", "Istanbul", "Singapore", "Rome", "Mumbai", "Jakarta", "Tokyo", "Seoul", "Paris", "Chicago"]
    let popularCities = ["Tehran", "New York", "Dubai", "London"]
    @State private var searchText = "" // Состояние для хранения текста поиска
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        NavigationView {
            
            ZStack {
                Image("backfone")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer().frame(height: 40)
                    
                    
                    HStack(){
                        Button(action: {
                            print("Print")
                            self.presentationMode.wrappedValue.dismiss()




                        }, label: {
                            Image(systemName: "chevron.backward")
                                .tint(.white)
                                .font(.system(size: 20, weight: .bold))
                        })
                        .padding()
                        
                        
                        Text("Search for City")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    
                    // Поле поиска
                    SearchBar(text: $searchText)
                    
                    // Секция для популярных городов
                    ScrollView(.horizontal, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text("Popular Cities")
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                
                            HStack {
                                
                                ForEach(popularCities, id: \.self) { city in
                                    Button(action: {}) {
                                        Text(city)
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 10)
                                            .background(Color.gray
                                                . brightness(/*@START_MENU_TOKEN@*/0.60/*@END_MENU_TOKEN@*/))
                                            .foregroundColor(Color.black
                                                .opacity(0.7))
                                            .cornerRadius(16)
                                    }
                                    .padding(.horizontal, 4)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    .frame(height: 70) // Установить высоту для ScrollView
                    
                    // Список городов
                    List {
                        ForEach(cities, id: \.self) { city in
                            HStack {
                                Text(city)
                                    .foregroundColor(.white)
                                Spacer()
                                Button(action: {}) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                        .listRowBackground(Color.clear)
                        
                    }
                    
                    .listStyle(PlainListStyle()) // Стиль списка без разделителей
                }
                //.navigationBarTitle("Search for City", displayMode: .inline)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchCityView()
}
