//
//  PerfilViewModel.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import SwiftUI
import Combine

class PerfilViewModel: ObservableObject {
    @Published var selectedImage: UIImage?

    func updateInformation() {
        
        objectWillChange.send()
    }
}
