//
//  Model.swift
//  SalandriFetchIOSChallenge
//
//  Created by Abhishek Salandri on 9/19/23.
//

import Foundation

struct DessertResponse: Decodable {
    var meals: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    var id: String {
       idMeal
    }
}

struct RecipeResponse: Decodable {
    var meals: [RecipeDetails]
}

struct RecipeDetails: Decodable, Identifiable {
    let idMeal: String
    let strIngredient1: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient2: String?
    let strIngredient20: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strInstructions: String?
    let strMeal: String?
    let strMealThumb: String?
    let strMeasure1: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure2: String?
    let strMeasure20: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    
    var id: String {
       idMeal
    }
    
    var ingredients: Array<String?> {
        [
            (strIngredient1 ?? "").capitalized + ", " + (strMeasure1 ?? ""),
            (strIngredient2 ?? "").capitalized + ", " + (strMeasure2 ?? ""),
            (strIngredient3 ?? "").capitalized + ", " + (strMeasure3 ?? ""),
            (strIngredient4 ?? "").capitalized + ", " + (strMeasure4 ?? ""),
            (strIngredient5 ?? "").capitalized + ", " + (strMeasure5 ?? ""),
            (strIngredient6 ?? "").capitalized + ", " + (strMeasure6 ?? ""),
            (strIngredient7 ?? "").capitalized + ", " + (strMeasure7 ?? ""),
            (strIngredient8 ?? "").capitalized + ", " + (strMeasure8 ?? ""),
            (strIngredient9 ?? "").capitalized + ", " + (strMeasure9 ?? ""),
            (strIngredient10 ?? "").capitalized + ", " + (strMeasure10 ?? ""),
            (strIngredient11 ?? "").capitalized + ", " + (strMeasure11 ?? ""),
            (strIngredient12 ?? "").capitalized + ", " + (strMeasure12 ?? ""),
            (strIngredient13 ?? "").capitalized + ", " + (strMeasure13 ?? ""),
            (strIngredient14 ?? "").capitalized + ", " + (strMeasure14 ?? ""),
            (strIngredient15 ?? "").capitalized + ", " + (strMeasure15 ?? ""),
            (strIngredient16 ?? "").capitalized + ", " + (strMeasure16 ?? ""),
            (strIngredient17 ?? "").capitalized + ", " + (strMeasure17 ?? ""),
            (strIngredient18 ?? "").capitalized + ", " + (strMeasure18 ?? ""),
            (strIngredient19 ?? "").capitalized + ", " + (strMeasure19 ?? ""),
            (strIngredient20 ?? "").capitalized + ", " + (strMeasure20 ?? ""),
        ]
    }
    
    var instructions: [String]? {
        var instructions = strInstructions?.components(separatedBy: "\n")
        instructions?.removeAll { value in
            return value.count < 3
        }
        return instructions
    }
}
