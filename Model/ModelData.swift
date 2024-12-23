//
//  ModelData.swift
//  RecipeExplorer
//
//  Created by Goutham Ganesan on 22/12/24.
//

import Foundation

var recipes: [Recipe] = load("recipe.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError( "Couldn't find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError( "Couldn't load \(filename): \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    } catch {
        fatalError( "Couldn't decode \(filename): \(error)")
    }
}
