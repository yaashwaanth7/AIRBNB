//
//  Listing.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import Foundation
//    Listing: The Identifiable protocol is used to provide a unique identifier for instances of a type. It requires the implementation of a property called id, which must be unique within a collection or a context where identification is necessary.
   
//    The Codable protocol in Swift is a combination of Encodable and Decodable protocols. Types that conform to Codable can be converted to and from external representations, such as JSON, using Encoder and Decoder.

struct Listing : Identifiable , Codable, Hashable{
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl : String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    var imageURLS: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}


enum ListingFeatures : Int , Codable , Identifiable , Hashable{
    case selfCheckIn
    case superHost
    
    var imageName: String{
        switch self {
        case .selfCheckIn : return "door.left.hand.open"
        case .superHost : return "medal"
        }
    }
    
    
    var title: String{
        switch self{
        case .selfCheckIn: return "Self Check-In"
        case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String{
        switch self{
        case .selfCheckIn: return "Check yourself in with the keypad"
        case .superHost: return "Superhost are experienced , highly rated hosts who are commited to providing grate stars for guests"
        }
    }
    
    var id: Int {return self.rawValue}
}


enum ListingAmenities : Int , Codable , Identifiable , Hashable{
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    case parking
    
    var title: String {
        switch self {
        case .pool : 
            return "Pool"
        case .kitchen:
            return "Kitchen"
        case .wifi:
            return "Wifi"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .alarmSystem:
            return "Alarm System"
        case .office:
            return "Office"
        case .balcony:
            return "Balcony"
        case .parking:
            return "Parking"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool :
            return "figure.pool.swim"
        case .kitchen:
            return "fork.knife"
        case .wifi:
            return "wifi"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .alarmSystem:
            return "checkerboard.sheild"
        case .office:
            return "pencil.and.ruler.fill"
        case .balcony:
            return "building"
        case .parking:
            return "car"
        }
    }
    
    
    var id: Int {return self.rawValue}

    
}


enum ListingType : Int , Codable , Identifiable , Hashable{
    case apartment
    case house
    case townhouse
    case villa
    
    var description: String{
        switch self{
        case .apartment:
            return "Apartment"
        case .house:
            return "House"
        case .townhouse:
            return "Town House"
        case .villa:
            return "Villa"
        }
    }
    
    var id: Int {return self.rawValue}
    
}
