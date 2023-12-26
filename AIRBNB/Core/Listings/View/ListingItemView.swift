//
//  ListingItemView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8){
            // images
            ListingImageCarouselView(listing: listing)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(height:320)
                
            // listing Details
            HStack(alignment: .top){
                
                // details
                VStack(alignment: .leading){
                    Text("\(listing.city), \(listing.state)")
                        .foregroundStyle(.black)
                    
                    Text("12 min away")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("/ night")
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                // rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.black)
                    
                    Text("\(listing.rating)")
                        .foregroundStyle(.black)
                }
                
            }
            .font(.footnote)
            
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
