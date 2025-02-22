//
//  RegisterView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 19/02/25.
//

import SwiftUI

struct RegisterView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @State private var username: String = ""
    
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            VStack {
                TextField("Ingrese su email", text: $email)
                    .modifier(TextFieldModifiers())
                
                SecureField("Ingresa su password", text: $password)
                    .modifier(TextFieldModifiers())
                
                TextField("Ingrese su nombre completo", text: $fullname)
                    .modifier(TextFieldModifiers())
                
                TextField("Ingrese su nombre de usuario", text: $username)
                    .modifier(TextFieldModifiers())
            }
            .padding(.vertical, 16)
            
            Button {
                router.goBack()
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
