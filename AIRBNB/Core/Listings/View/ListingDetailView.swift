//
//  ListingDetailView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing){
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "Los Angles" ? .losAngles : .miami, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading){
                
                ListingImageCarouselView(listing: listing)
                    .frame(height:320)
                
                Button{
                    print("Hello")
                    dismiss()
                }label: {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.white)
                        .overlay{
                            Image(systemName: "chevron.left")
                                .foregroundStyle(.black)
                                .fontWeight(.bold)
                        }
                        
                        .padding(32)
                }
                
//                Button{
//                    dismiss()
//                }
//                label: {
//                    Image(systemName: "chevron.left")
//                        .foregroundStyle(.black)
//                        .background{
//                            Circle()
//                                .fill(.white)
//                                .frame(width: 32, height: 32)
//                        }
//                        .padding(32)
//                        
//                }
                
               
            }
            
            VStack(alignment: .leading, content: {
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                
                VStack(alignment: .leading, content: {
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text("-")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city) , \(listing.state)")
                })
                .font(.caption)
            })
            .padding(.leading)
            .frame(maxWidth:.infinity,alignment: .leading)
            
            Divider()
            
            // host info view
            
            HStack(){
                VStack(alignment: .leading, spacing: 4){
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250 , alignment: .leading)
                    
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) Guests - ")
                        Text("\(listing.numberOfBedrooms) Bedrooms - ")
                        Text("\(listing.numberOfBeds) Beds - ")
                        Text("\(listing.numberOfBathrooms) Bath")
                    }
                    .font(.caption)
                }
                .frame(width: 300,alignment: .leading)
                
                
                Spacer()
                
                Image("\(listing.ownerImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            
            Divider()
            
            // listing features
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(listing.features){feature in
                    HStack(spacing: 12){
                        Image(systemName: "\(feature.imageName)")
                        
                        VStack(alignment: .leading){
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            
                            Text("\(feature.subtitle)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
            .padding()
            
            
            Divider()
            
            // bedroom view
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach( 1 ... listing.numberOfBedrooms,id: \.self){bedroom in
                            VStack(){
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay{
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }.scrollTargetBehavior(.paging)
            }
            .padding()
            
            
            Divider()
            
            // listing amenities
            VStack(alignment: .leading , spacing: 16){
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) {feature in
                    
                    HStack{
                        Image(systemName: "\(feature.imageName)")
                            .frame(width: 32)
                        
                        Text("\(feature.title)")
                            .font(.footnote)
                        
                        
                        Spacer()
                    }
                    
                }
            }.padding()
            
            
            Divider()
            
            // map
            
            VStack(alignment: .leading , spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 72)
        .overlay(alignment: .bottom){
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                            
                        Text("Jan 18 - 22")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140 , height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    })
                }
                .padding(.horizontal,32)
                
                
            }
            .background(.white)
        }
        
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
