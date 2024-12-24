//
//  Recipe.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 22/12/24.
//

import Foundation
import SwiftUI

struct Recipe: Decodable {
    let id: Int
    var title: String
    var description: String
    var ingredients: String
    var cuisine: String
    
    private var rawDirections: String
    var directions: LocalizedStringKey {
        LocalizedStringKey(rawDirections)
    }
    
    private let imageName: String
    var image: Image {
        Image(imageName)
    }
}

extension Recipe {
    private static var cachedCuisineList: [String] = []
    
    static var cuisineList: [String] {
        cachedCuisineList.isEmpty ? fetchCuisineList() : cachedCuisineList
    }
    
    private static func fetchCuisineList() -> [String] {
        let cuisineSet = recipes.map { $0.cuisine }
        return Array(Set((cuisineSet))).sorted()
    }
    
    static func updateCuisineList() {
        cachedCuisineList = fetchCuisineList()
    }
}
