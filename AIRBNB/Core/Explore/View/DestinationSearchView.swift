//
//  DestinationSearchView.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show:Bool
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    @ObservedObject var viewModel: ExploreViewModel
    
    
    
    var body: some View {
        VStack(){
            HStack{
                Button(action: {
                    withAnimation(.snappy){
                        viewModel.updateListingForLocation()
                        show.toggle()

                    }
                }, label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                })
                
                Spacer()
                
                if(!viewModel.searchLocation.isEmpty){
                    Button(action: {
                        viewModel.searchLocation = ""
                        viewModel.updateListingForLocation()
                    }, label: {
                        Text("clear")
                    })
                }
            }.padding()
            
            VStack(alignment: .leading){
                if(selectedOption == .location){
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingForLocation()
                                show.toggle()
                            }
                        
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(Color(.systemGray4))
                    }
                }else{
                    withAnimation(.snappy){
                        ExtractedView(title: "Where", description: "Add destination")
                    }
                }
             
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .location
                }
            }
            
            
            // Date selection View
            VStack(alignment: .leading){
                if(selectedOption == .dates){
                   
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack{
                        // titlekey: , selection: , displayCompnents:
                        DatePicker("From", selection: $startDate, displayedComponents: .date)
                        
                        Divider()
                        
                        DatePicker("To", selection: $endDate, displayedComponents: .date)
                        
                        
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    
                }else{
                    ExtractedView(title: "When", description: "Add dates")
                        
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .dates
                }
            }
            
            
            // Num Guests View
            VStack(alignment: .leading){
                if(selectedOption == .guests){
                    Text("Who's comming")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    // label: , onIncrement: , onDecrement:
                    Stepper{
                        Text("\(numGuests) Adults")
                    }onIncrement: {
                            numGuests += 1
                        print("Add 1")
                    }onDecrement: {
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                        print("Dec 1")
                    }
                       
                }else{
                    ExtractedView(title: "Who", description: "Add guests")
            }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy){
                    selectedOption = .guests
                }
            }
            
        }
        
        
        Spacer()
    }
   
}

#Preview {
    DestinationSearchView(show: .constant(false),viewModel: ExploreViewModel(service: ExploreService()))
}

struct ExtractedView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }

    }
}

struct CollapsableDestinationViewModifier : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}
