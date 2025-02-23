//
//  RegisterView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 19/02/25.
//

import SwiftUI

struct RegisterView: View {
        
    @EnvironmentObject var router: NavigationRouter
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            VStack {
                TextField("Ingrese su email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .modifier(TextFieldModifiers())
                
                SecureField("Ingresa su password", text: $viewModel.password)
                    .modifier(TextFieldModifiers())
                
                TextField("Ingrese su nombre completo", text: $viewModel.fullname)
                    .modifier(TextFieldModifiers())
                
                TextField("Ingrese su nombre de usuario", text: $viewModel.username)
                    .textInputAutocapitalization(.never)
                    .modifier(TextFieldModifiers())
            }
            .padding(.vertical, 16)
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                Text("Registro")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Spacer()
            
            Divider()
            
            HStack {
                Text("¿Tienes una cuenta?")
                
                Button {
                    router.goBack()
                } label: {
                    Text("Login")
                        .fontWeight(.semibold)
                    
                }
            }
            .font(.footnote)
            .foregroundColor(.black)
            .padding(.vertical, 16)

        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterView()
}
