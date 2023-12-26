//
//  ExploreViewModel.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 25/12/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var searchLocation = ""
    @Published var listings = [Listing]()
    private let service : ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task{
            await fetchListings()
        }
    }
    
    
    func fetchListings() async{
        do{
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
            
        }catch{
            print("DEBUG: Failed to fetch listings with error : \(error.localizedDescription)")
        }
    }
    
    // filtering location based on search by users
    func updateListingForLocation(){
        let filteredListing = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListing.isEmpty ? listingsCopy : filteredListing
    }
}
