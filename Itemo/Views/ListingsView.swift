//
//  ContentView.swift
//  Itemo
//
//  Created by Jaime Lucea on 17/4/25.
//

import SwiftUI

struct ListingsView: View {
    
    @StateObject var viewModel = ListingsViewModel()
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.listings) { listing in
                ListingRowView(listing: listing)
            }
            .navigationTitle("Listings")
            .task {
                await viewModel.loadData()
            }
        }
    }

}

#Preview {
    ListingsView(viewModel: .init(service: MockListingsService()))
}
