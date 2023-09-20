//
//  ContentView.swift
//  SalandriFetchIOSChallenge
//
//  Created by Abhishek Salandri on 9/19/23.
//

import SwiftUI

struct ContentView: View {    
    var viewModel = ViewModel()
    
    var body: some View {
        ListView(viewModel: viewModel)
            .onAppear() {
                viewModel.getData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
