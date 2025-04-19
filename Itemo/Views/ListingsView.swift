//
//  ContentView.swift
//  Itemo
//
//  Created by Jaime Lucea on 17/4/25.
//

import SwiftUI

struct ListingsView: View {
    
    @StateObject var viewModel = ListingsViewModel()
    
    private let gridColumns = Array(repeating: GridItem(.flexible(minimum: 100)), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 30) {
                ForEach (viewModel.listings, id: \.id) { ad in
                    ListingItemView(ad: ad)
                }
            }
        }
        .padding(10)
        .navigationTitle("Listings")
        .task {
            await viewModel.loadData()
        }
    }

}


#Preview {
    ListingsView()
}

#Preview("Mock Data") {
    ListingsView(viewModel: .init(service: MockListingsService()))
}
