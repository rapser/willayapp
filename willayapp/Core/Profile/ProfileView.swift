//
//  ProfileView.swift
//  twitter-clone
//
//  Created by miguel tomairo on 20/02/25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Charles Leclerc")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text("charles_leclerc")
                                .font(.subheadline)
                            
                        }
                        
                        Text("Formula 1 driver for scuderia ferrari")
                            .font(.footnote)
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    CircularProfileImageView()
                    
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 40)
                        .background(Color(.black))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases, id: \.self) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 180 , height: 1)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                }else {
                                    
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 180 , height: 1)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring) {
                                    selectedFilter = filter
                                }
                            }
                            
                        }
                    }
                    
                    LazyVStack {
                        ForEach(0 ... 10, id: \.self) { thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)

            }
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    ProfileView()
}
