//
//  ProfileView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            // profile
            VStack(alignment: .leading , spacing: 32){
                VStack(alignment: .leading,spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Login to start planning your next trip")
                }
                
                
                Button(action: {
                    print("Login")
                }, label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360,height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                })
                
                HStack{
                    Text("Don't have an account?")
                        .fontWeight(.semibold)
                        .underline()
                    
                }
                .font(.caption)
            }
            
            // profile options
            VStack(spacing:24){
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessiblity")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
