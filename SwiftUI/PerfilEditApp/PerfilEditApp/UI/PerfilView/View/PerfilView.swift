//
//  PerfilView.swift
//  PerfilEditApp
//
//  Created by Daniel Cazorro Frias  on 19/1/24.
//

import SwiftUI

struct PerfilView: View {
    // ViewModel
    @ObservedObject var viewModel: PerfilViewModel
    
    // Private objects
    @State private var showAlert = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    // Life cycle
    var body: some View {
        NavigationView {
            
            VStack {
                // Espacio entre la imagen y el navigation Bar
                Divider()
                    .overlay(.background)
                    .frame(height: 24)
                
                ZStack {
                    // Main Picture
                    Image(uiImage: viewModel.selectedImage ?? UIImage(named: "main")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 152, height: 152)
                        .cornerRadius(160)
                        .shadow(radius: 3, x:0, y:6)
                    Image(systemName: "photo.circle")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .offset(x: 50, y: 60)
                    
                        .onTapGesture {
                            //MARK: TODO Al tocar la imagen, abre la galería de imágenes
                            self.openImagePicker()
                        }
                    
                }
                
                
                // Espacio entre imagen y textlabel correo electrónico
                Divider()
                    .overlay(.background)
                    .frame(height: 36)
                
                Text("Correo electrónico")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .font(.custom("arial", size: 14)).bold()
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .padding(.bottom, 10)
                
                Text("a.jimenez@vass.es")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .font(.custom("arial", size: 16))
                
                // Espacio entre correo electrónico y teléfono móvil
                Divider()
                    .overlay(.background)
                    .frame(height: 21)
                
                Text("Teléfono móvil")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .font(.custom("arial", size: 14)).bold()
                
                // Espacio entre teléfono móvil label y teléfono movil textfield
                Divider()
                    .overlay(.background)
                    .frame(height: 6)
                
                TextField("Número de teléfono",text:$viewModel.phoneNumber)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                // Espacio entre textfield número de teléfono y nombre completo
                Divider()
                    .overlay(.background)
                    .frame(height: 16)
                
                Text("Nombre completo")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .font(.custom("arial", size: 14)).bold()
                
                Text("Alejandro Jiménez")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .font(.custom("arial", size: 16))
                
                // Espacio entre alejandro y oficinas
                Divider()
                    .overlay(.background)
                    .frame(height: 20)
                
                Text("Oficinas")
                    .font(.custom("arial", size: 14)).bold()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                
                Text("VASS Madrid")
                    .font(.custom("arial", size: 16))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                
                // Espacio entre VASS Madrid y sobre mi
                Divider()
                    .overlay(.background)
                    .frame(height: 20)
                
                Text("Sobre mi")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 64)
                    .font(.custom("arial", size: 14)).bold()
                
                // Espacio entre sobre mi label y sobre mi text field
                Divider()
                    .overlay(.background)
                    .frame(height: 6)
                
                TextField("Información sobre mi",text: $viewModel.aboutMe)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                // Espacio entre textfield sobre mi y botón actualizar
                Divider()
                    .overlay(.background)
                    .frame(height: 79)
                
                
                Button(action: {
                    self.tapUpdateButton()
                }) {
                    Text("Actualizar")
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .frame(width: 343, height: 56)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
                }
                .disabled(!viewModel.isUpdateButtonEnabled) // Deshabilita el botón si las condiciones no se cumplen
                .onReceive(viewModel.showAlert) { alert in
                    self.alertTitle = alert.0
                    self.alertMessage = alert.1
                    self.showAlert = true
                }
                
                .buttonStyle(.borderedProminent)
            }
            .textFieldStyle(.roundedBorder)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .navigationBarTitle("Editar Perfil")
            .navigationBarTitleDisplayMode(.inline) // Centra el título en la barra de navegación
            .navigationBarItems(
                leading: Button(action: {
                    
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.title2)
                        .foregroundColor(.blue)
                },
                trailing: HStack {
                    
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .disabled(viewModel.selectedImage == nil) // Deshabilita el botón si no hay imagen seleccionada
                    
                }
            )
        }
    }
    
    private func openImagePicker() {
        guard let url = URL(string: "photos-redirect://") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func tapUpdateButton() {
        viewModel.updateInformation()
    }
    
    
}

#Preview {
    PerfilView(viewModel: PerfilViewModel())
}
