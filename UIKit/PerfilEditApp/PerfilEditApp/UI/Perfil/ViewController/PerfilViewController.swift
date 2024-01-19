//
//  PerfilViewController.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import UIKit

// MARK: - Protocol
protocol PerfilViewModelDelegate: AnyObject {
    func didUpdateInformation()
}

class PerfilViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var navigationBackButton: UIButton!
    @IBOutlet weak var navigationCloseButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIImageView!
    @IBOutlet weak var imageViewBackShadow: UIImageView!
    
    @IBOutlet weak var emailStackView: UIStackView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailCompleteLabel: UILabel!
    
    @IBOutlet weak var phoneStackView: UIStackView!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCompleteLabel: UILabel!
    
    @IBOutlet weak var officeStackView: UIStackView!
    @IBOutlet weak var officeNameLabel: UILabel!
    @IBOutlet weak var officeNameCompleteLabel: UILabel!
    
    @IBOutlet weak var aboutMeStackView: UIStackView!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    @IBOutlet weak var aboutMeTextField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    // ViewModel
    var perfilViewModel = PerfilViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar delegados de los text fields
        phoneNumberTextField.delegate = self
        aboutMeTextField.delegate = self
        
        // Deshabilitamos el botón de acctualización inicialmente
        updateButton.isEnabled = false
        
        // Configurar el delegado del ViewModel
        perfilViewModel.delegate = self
        
        // MARK: Main Picture
        // Configura la imagen como redonda con sombra
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        // FIXME: Este contentMode debemos modificarlo para enfocar mejor la imagen
        imageView.contentMode = .topLeft
        
        // MARK: Shadow of the picture
        // Configura la view trasera para la sombra: Se hace mas grande y se baja un poco
        let extraSize: CGFloat = 1
        let newSize = imageView.frame.size.width + extraSize
        imageViewBackShadow.frame = CGRect(x: imageView.frame.origin.x - extraSize/2,
                                           y: imageView.frame.origin.y - extraSize/2,
                                           width: newSize,
                                           height: newSize)
        imageViewBackShadow.layer.cornerRadius = imageViewBackShadow.frame.size.width / 2
        imageViewBackShadow.layer.masksToBounds = false // Permite sombras
        
        // Agrega la sombra a imageViewBackShadow
        imageViewBackShadow.layer.shadowColor = UIColor.black.cgColor
        imageViewBackShadow.layer.shadowOpacity = 0.3
        imageViewBackShadow.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageViewBackShadow.layer.shadowRadius = 2
        
        // Configurar el gesto para la imagen
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageButton))
        imageButton.isUserInteractionEnabled = true
        imageButton.addGestureRecognizer(tapGesture)
    }
    
    // MARK: IBActions
    @IBAction func tapUpdateButton(_ sender: Any) {
        perfilViewModel.updateInformation()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Este método se llama cada vez que se realiza un cambio en el texto de un text field
        
        // Verifica si ambos text fields tienen contenido
        let phoneNumberText = phoneNumberTextField.text ?? ""
        let aboutMeText = aboutMeTextField.text ?? ""
        
        // Habilita el botón de actualización solo si ambos text fields tienen contenido
        updateButton.isEnabled = !phoneNumberText.isEmpty && !aboutMeText.isEmpty
        
        return true
    }
    
    // Método para mostrar la alerta
    func showAlert() {
        let alertController = UIAlertController(
            title: "Información actualizada",
            message: "La información se ha actualizado correctamente.",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /// Función que reconoce al pulsar sobre la imagen que abre la galería
    @objc func tapImageButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - PerfilViewModelDelegate
extension PerfilViewController: PerfilViewModelDelegate {
    func didUpdateInformation() {
        showAlert()
    }
}