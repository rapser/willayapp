//
//  CreateThreadView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 20/02/25.
//

import SwiftUI

struct CreateThreadView: View {
    
    @State private var caption = ""
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    
                    CircularProfileImageView()

                    VStack(alignment: .leading, spacing: 4) {
                        Text("charles_leclerc")
                            .fontWeight(.semibold)
                        
                        TextField("Inicia un hilo ...", text: $caption, axis: .vertical)

                    }
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                      
                }
                .font(.footnote)
                
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") {
                        router.dismissModal()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Post") {
                        
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }

            }
        }
    }
}

#Preview {
    CreateThreadView()
}
