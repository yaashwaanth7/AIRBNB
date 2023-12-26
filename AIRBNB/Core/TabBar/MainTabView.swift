//
//  MainTabView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore",systemImage: "magnifyingglass")
                }
            
            
            
            WishlistView()
                .tabItem {
                    Label("Wishlist",systemImage: "heart")
                }
            
            
            ProfileView()
                .tabItem {
                    Label("Profile",systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
