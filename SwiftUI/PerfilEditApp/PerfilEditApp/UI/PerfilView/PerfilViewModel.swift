//
//  PerfilViewModel.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import SwiftUI
import Combine
import UIKit

class PerfilViewModel:ObservableObject {

    @Published var selectedImage: UIImage?
    @Published var phoneNumber: String = ""
    @Published var aboutMe: String = ""

    // Propiedad para habilitar/deshabilitar el botón de actualizar
    var isUpdateButtonEnabled: Bool {
        return !phoneNumber.isEmpty && !aboutMe.isEmpty
    }
    
    func updateInformation() {
        // Verifica si los campos están rellenos
        guard !phoneNumber.isEmpty, !aboutMe.isEmpty else {
            showAlertError()
            return
        }
        // Notifica a la vista que la información se actualizó con éxito
        showAlertSuccess()
    }

    // MARK: - Private functions
    private func showAlertSuccess() {
        // Muestra la alerta de éxito
        showAlert(title: "Información actualizada", message: "La información se ha actualizado correctamente.")
    }

    private func showAlertError() {
        // Muestra la alerta de error
        showAlert(title: "Error", message: "Ambos campos deben estar llenos.")
    }

    private func showAlert(title: String, message: String) {
        // Publica la alerta en la vista
        showAlertPublisher.send((title, message))
    }

    // Combine Publisher para manejar las alertas
    @Published private var showAlertPublisher = PassthroughSubject<(String, String), Never>()

    var showAlert: AnyPublisher<(String, String), Never> {
        showAlertPublisher.eraseToAnyPublisher()
    }
}

