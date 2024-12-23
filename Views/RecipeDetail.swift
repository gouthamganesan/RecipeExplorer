//
//  RecipeDetail.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 23/12/24.
//

import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            recipe.image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.title)
                        .font(.headline)
                    Text(recipe.cuisine)
                        .font(.caption)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 5)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Capsule())
                }
                .padding(.bottom, 2)
                Text(recipe.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                Divider()
                Text("Ingredients")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 2)
                Text(recipe.ingredients)
                    .padding(.bottom, 5)
                Divider()
                Text("Directions")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 2)
                Text(recipe.directions)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RecipeDetail(recipe: recipes[0])
}
