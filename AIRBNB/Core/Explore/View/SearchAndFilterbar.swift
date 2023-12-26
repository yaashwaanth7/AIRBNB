//
//  SearchAndFilterbar.swift
//  AIRBNB
//
//  Created by G Yashwanth Sharma on 24/12/23.
//

import SwiftUI

struct SearchAndFilterbar: View {
    @Binding var location: String
    var body: some View {
        HStack{
            
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading , spacing: 2){
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Anywhere -" : "" ) Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
                
            })
        }.padding(.horizontal)
            .padding(.vertical,10)
            .overlay{
                Capsule()
                    .stroke(lineWidth: 0.5)
                    .foregroundStyle(Color(.systemGray4))
                    .shadow(color: .black.opacity(0.4),radius:2)
            }
    }
}

#Preview {
    SearchAndFilterbar(location: .constant("Miami"))
}
