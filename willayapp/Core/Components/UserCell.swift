//
//  UserCell.swift
//  twitter-clone
//
//  Created by miguel tomairo on 20/02/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("maxverstappen1")
                    .fontWeight(.semibold)
                
                Text("Max Verstappen")
            }
            .font(.footnote)
            
            Spacer()

            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
