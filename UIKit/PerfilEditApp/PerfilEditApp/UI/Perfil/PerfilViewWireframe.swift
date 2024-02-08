//
//  PerfilViewWireframe.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 8/2/24.
//

import Foundation

class PerfilViewWireframe {
    
    // MARK: - Properties
    // Esta propiedad calculada proporciona una instancia de MainViewController cuando se accede a ella.
    var viewController: PerfilViewController {
        // Generando los componentes del módulo
        
        // Creamos una instancia de MainViewController
        let viewController = PerfilViewController()
        
        // Creamos una instancia de MainViewModel utilizando el método privado createViewModel(with:)
        let viewModel: PerfilViewModel = createViewModel()
        
        // Configuramos el viewModel creado en el viewController
        viewController.set(viewModel: viewModel)
        
        // Devolvemos el viewController configurado
        return viewController
    }
    
    // MARK: - Private methods
    
    // Este método privado crea una instancia de MainViewModel con un MainViewDataManager proporcionado como argumento.
    private func createViewModel() -> PerfilViewModel {
        return PerfilViewModel()
    }

}
