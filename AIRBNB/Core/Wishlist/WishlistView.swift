//
//  WishlistView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 32){
                Text("Wishlist")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading , spacing: 50){
                    VStack(alignment: .leading ){
                        Text("Log in to view your wishlists")
                            .font(.headline)
                        
                        Text("You can create, view or edit wishlist once you've logged in")
                            .font(.footnote)
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
                    
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WishlistView()
}
