//
//  ViewModel.swift
//  SalandriFetchIOSChallenge
//
//  Created by Abhishek Salandri on 9/19/23.
//

import Foundation

class ViewModel: Observable {
    let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
    var recipeList: [Recipe] = []
    var recipeDetails: RecipeDetails?
    
    func getData() {
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    // var response = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                    let recipeData = try decoder.decode(DessertResponse.self, from: data)
                    self.recipeList = recipeData.meals
//                    print(recipeList.meals[0].idMeal)
//                    print(recipeList.meals[0].strMeal)
//                    print(recipeList.meals[0].strMealThumb)
//                    print(recipeList)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getRecipe(mealId: String) {
        let recipeURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")
        
        let task = URLSession.shared.dataTask(with: recipeURL!) { data, response, error in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    // let response = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                    // print(response ?? "nothing")
                    let recipeData = try decoder.decode(RecipeResponse.self, from: data)
                    self.recipeDetails = recipeData.meals[0]
                    // print(self.recipeDetails)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
