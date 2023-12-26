//
//  DeveloperPreview.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 25/12/23.
//

import Foundation

class DeveloperPreview{
    
    static let shared = DeveloperPreview()
    
    
    var listings : [Listing] = [
        
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jhon Smith",
            ownerImageUrl: "person2",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageURLS: ["listing1","listing2","listing3","listing4","listing5"],
            address: "124 Main St",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn,.superHost],
            amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
            type: .villa
        ),
        
            .init(
                id: NSUUID().uuidString,
                ownerUid: NSUUID().uuidString,
                ownerName: "Lary Mial",
                ownerImageUrl: "person1",
                numberOfBedrooms: 4,
                numberOfBathrooms: 3,
                numberOfGuests: 4,
                numberOfBeds: 4,
                pricePerNight: 567,
                latitude: 25.7706,
                longitude: -80.1340,
                imageURLS: ["listing1","listing2","listing3","listing4","listing5"],
                address: "124 Main St",
                city: "Losangles",
                state: "California",
                title: "Miami Villa",
                rating: 4.86,
                features: [.selfCheckIn,.superHost],
                amenities: [.wifi,.alarmSystem,.balcony,.laundry,.tv],
                type: .villa
            )
    ]
}
