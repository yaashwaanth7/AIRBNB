//
//  ExploreView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        if showDestinationSearchView {
            DestinationSearchView(show: $showDestinationSearchView,viewModel: viewModel)
        }else{
            NavigationStack{
                ScrollView{
                    // Search bar
                    SearchAndFilterbar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    
                    LazyVStack(spacing: 32){ // we want to render what we see
                        ForEach(viewModel.listings , id: \.self ){listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                     .frame(height: 400)
                                     .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    
                    
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                    }
                .padding()
            }
        }
       
    }
}

#Preview {
    ExploreView()
}
