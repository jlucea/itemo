//
//  ListingsViewModel.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

import Foundation

/// A view model responsible for loading and exposing classified ads (`ClassifiedAd`) for display.
///
/// `ListingsViewModel` uses a dependency-injected `ListingsServiceProtocol` to asynchronously fetch
/// listings. On success, the listings are published to the UI. On failure, it logs the error.
@MainActor
final class ListingsViewModel: ObservableObject {
    
    /// The list of classified ads to be shown in the UI.
    @Published var listings: [ClassifiedAd] = []
    
    let service: ListingsServiceProtocol
    
    init(service: ListingsServiceProtocol = ListingsService()) {
        self.service = service
    }
    
    /// Asynchronously loads data using the injected service and updates the `listings` property.
    func loadData() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("ERROR while fetching data")
        }
    }
    
}
