//
//  ExploreService.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 25/12/23.
//

import Foundation


class ExploreService {
    func fetchListings() async throws -> [Listing]{
        return DeveloperPreview.shared.listings
    }
}
