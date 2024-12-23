//
//  RecipeList.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 23/12/24.
//

import SwiftUI

struct RecipeList: View {
    var body: some View {
        NavigationSplitView {
            List(recipes, id: \.id) { recipe in
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
