//
//  LoginView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 19/02/25.
//

import SwiftUI

struct LoginView: View {
    
//    @State private var email: String = ""
//    @State private var password: String = ""
    
    @StateObject private var viewModel = LoginViewModel()

    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        
        NavigationStack(path: $router.path) {
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                VStack {
                    TextField("Ingrese su email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifiers())
                    
                    SecureField("Ingresa su password", text: $viewModel.password)
                        .modifier(TextFieldModifiers())
                }
                
                Button {
                    router.navigate(to: .forgetPassword)
                } label: {
                    Text("Olvidaste tu password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                
                Button {
//                    router.navigate(to: .feed)
                    Task { try await viewModel.login()}
                    
                } label: {
                    Text("Login")
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
                    Text("¿No tienes una cuenta?")
                    
                    Button {
                        router.navigate(to: .register)
                    } label: {
                        Text("Sign Up")
                            .fontWeight(.semibold)

                    }
                }
                .font(.footnote)
                .foregroundColor(.black)
                .padding(.vertical, 16)
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .register:
                    RegisterView()
                case .feed:
                    FeedView()
                case .forgetPassword:
                    ForgetPasswordView()
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(NavigationRouter())
}
