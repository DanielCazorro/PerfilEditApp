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
    @State private var phoneNumber: String = ""
    @State private var aboutMe: String = ""
    @State private var showAlert = false
    
    // Life cycle
    var body: some View {
        NavigationView {
            VStack {
                // Espacio entre la imagen y el navigation Bar
                Divider()
                    .overlay(.background)
                    .frame(height: 24)
                
                // Main Picture
                Image(uiImage: viewModel.selectedImage ?? UIImage(named: "main")!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 152, height: 152)
                    .cornerRadius(160)
                    .shadow(radius: 3, x:0, y:6)
                
                    .onTapGesture {
                        // Al tocar la imagen, abre la galería de imágenes
                        self.openImagePicker()
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
                
                TextField("Número de teléfono",text: $phoneNumber)
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
                
                TextField("Información sobre mi",text: $aboutMe)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                
                // Espacio entre textfield sobre mi y botón actualizar
                Divider()
                    .overlay(.background)
                    .frame(height: 79)
                
                
                Button(action: {
                    self.viewModel.updateInformation()
                    self.showAlert = true
                }) {
                    Text("Actualizar")
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .frame(width: 343, height: 56)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Información actualizada"),
                          message: Text("La información se ha actualizado"),
                          dismissButton: .default(Text("OK")))
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
                        .font(.title)
                        .foregroundColor(.blue)
                },
                trailing: HStack {
                    
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .disabled(viewModel.selectedImage == nil) // Deshabilita el botón si no hay imagen seleccionada
                    
                }
            )
        }
    }
    
    private func openImagePicker() {
        
    }
    
    private func tapUpdateButton() {
        
    }
    
    
}

#Preview {
    PerfilView(viewModel: PerfilViewModel())
}
