//
//  ListingsViewModel.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

import Foundation

@MainActor
final class ListingsViewModel: ObservableObject {
    
    @Published var listings: [ClassifiedAd] = []
    
    let service: ListingsServiceProtocol
    
    init(service: ListingsServiceProtocol = ListingsService()) {
        self.service = service
    }
    
    func loadData() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("ERROR while fetching data")
        }
    }
    
}
