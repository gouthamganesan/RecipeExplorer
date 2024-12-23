//
//  RecipeRow.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 22/12/24.
//

import Foundation
import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            recipe.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(recipe.title)
            
            Spacer()
        }
    }
}

#Preview {
    RecipeRow(recipe: recipes[0])
}
