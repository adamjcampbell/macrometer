//
//  ContentView.swift
//  macrometer
//
//  Created by Adam Campbell on 18/5/2024.
//

import SwiftUI

struct ContentView: View {

    @State var model = FoodModel()

    var body: some View {
        NavigationView {
            List(model.foods, id: \.foodKey) { food in
                Text(food.name)
            }
            .searchable(text: $model.searchText)
        }
    }
}

#Preview {
    ContentView()
}
