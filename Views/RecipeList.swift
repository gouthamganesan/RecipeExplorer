//
//  RecipeList.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 23/12/24.
//

import SwiftUI

struct RecipeList: View {
    @State private var selectedCuisine: String = "All"
    
    private var filteredRecipes: [Recipe] {
        selectedCuisine == "All" ? recipes : recipes.filter { $0.cuisine == selectedCuisine }
    }
    
    var body: some View {
        NavigationSplitView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(["All"] + Recipe.cuisineList, id: \.self) { cuisine in
                        Button(action: {
                            selectedCuisine = cuisine
                        }) {
                            Text(cuisine)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(cuisine == selectedCuisine ? Color.blue : Color.gray.opacity(0.2))
                                .foregroundColor(cuisine == selectedCuisine ? .white : .black)
                                .clipShape(Capsule())
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
            .padding([.leading, .trailing])
            List(filteredRecipes, id: \.id) { recipe in
                NavigationLink {
                    RecipeDetail(recipe: recipe)
                } label: {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationTitle(Text("Recipes"))
        } detail: {
            Text("Select a recipe")
        }
    }
}

#Preview {
    RecipeList()
}
