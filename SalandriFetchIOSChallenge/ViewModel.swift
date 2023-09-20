//
//  ViewModel.swift
//  SalandriFetchIOSChallenge
//
//  Created by Abhishek Salandri on 9/19/23.
//

import Foundation

class ViewModel: Observable {
    let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    // Array of all the Dessert recipes
    var recipeList: [Recipe] = []
    // Array of all details of a selected recipe
    var recipeDetails: RecipeDetails?
    
    // Retrieve all recipes from dessert category
    func getData() {
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let recipeData = try decoder.decode(DessertResponse.self, from: data)
                    self.recipeList = recipeData.meals
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    // Retrieve all details for a given recipe
    func getRecipe(mealId: String) {
        let recipeURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")
        
        let task = URLSession.shared.dataTask(with: recipeURL!) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let recipeData = try decoder.decode(RecipeResponse.self, from: data)
                    self.recipeDetails = recipeData.meals[0]
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
