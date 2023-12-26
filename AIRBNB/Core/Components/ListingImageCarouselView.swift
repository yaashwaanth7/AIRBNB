//
//  ListingImageCarouselView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

// mock data
//var images  = [
//"listing1",
//"listing2",
//"listing3",
//"listing4",
//"listing5",
//
//]

struct ListingImageCarouselView: View {
    let listing : Listing
    var body: some View {
        TabView{
            ForEach(listing.imageURLS , id: \.self){ image in
               Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
