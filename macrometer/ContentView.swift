//
//  ContentView.swift
//  macrometer
//
//  Created by Adam Campbell on 18/5/2024.
//

import SwiftUI

struct ContentView: View {

    @State var model = FoodModel()
    @State var showAdd = false

    var body: some View {
        NavigationView {
            List(model.addedFoods, id: \.foodKey) { food in
                Text(food.name)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        showAdd = true
                    }
                }
            }
        }
        .sheet(isPresented: $showAdd) {
            List(model.foods, id: \.foodKey) { food in
                Button {
                    model.addedFoods.append(food)
                } label: {
                    Text(food.name)
                }
            }
            .listStyle(.plain)
            .searchable(text: $model.searchText)
        }
    }
}

#Preview {
    ContentView()
}
