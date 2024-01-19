//
//  ContentView.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var perfilViewModel = PerfilViewModel()

    var body: some View {
        PerfilView(viewModel: perfilViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
