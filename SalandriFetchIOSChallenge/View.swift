//
//  View.swift
//  SalandriFetchIOSChallenge
//
//  Created by Abhishek Salandri on 9/19/23.
//

import SwiftUI

struct ListView: View {
    var viewModel: ViewModel
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if (self.isLoading) {
                // Show ProgressView while data is being fetched
                ProgressView()
            } else {
                // Once data loads, display in List
                NavigationView {
                    List {
                        ForEach(viewModel.recipeList) { recipe in
                            NavigationLink(destination: RecipeView(viewModel: viewModel, recipeId: recipe.idMeal)) {
                                Text(recipe.strMeal.capitalized)
                            }
                        }
                    }
                    .navigationTitle("Desserts")
                    .padding(.top, 15)
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ViewModel())
    }
}

struct RecipeView: View {
    var viewModel: ViewModel
    var recipeId: String
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if (self.isLoading) {
                // Show ProgressView while data is being fetched
                ProgressView()
            } else {
                // Once data loads, display in List
                Text((viewModel.recipeDetails?.strMeal ?? "No Title").capitalized)
                    .font(
                        .system(.title)
                        .weight(.bold)
                        )
                ingredientListView
                instructionListView
            }
        }
        .onAppear() {
            viewModel.getRecipe(mealId: recipeId)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
            }
        }
    }
    
    // Computed var for ingredient list
    var ingredientListView: some View {
        NavigationView {
            List {
                let ingredients = viewModel.recipeDetails?.ingredients ?? []
                ForEach(0...(ingredients.firstIndex(where: {$0 == nil || $0?.count ?? 0 <= 3}) ?? 20) - 1, id: \.self) { index in
                    Text((ingredients[index] ?? ""))
                }
            }
        }
    }
    
    // Computed var for instruction list
    var instructionListView: some View {
        NavigationView {
            List {
                let instructions = viewModel.recipeDetails?.instructions ?? []
                ForEach(instructions, id: \.self) { index in
                    Text(index)
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(viewModel: ViewModel(), recipeId: "")
    }
}
