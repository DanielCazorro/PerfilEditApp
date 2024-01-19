//
//  PerfilViewModel.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import Foundation

class PerfilViewModel {
    weak var delegate: PerfilViewModelDelegate?
    
    func updateInformation() {
        // Aquí podremos implementar lógica como que el número de teléfono sea correcto, etc.
        informationUpdated()
    }
    
    private func informationUpdated() {
        delegate?.didUpdateInformation()
    }
}
