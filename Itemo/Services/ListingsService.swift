//
//  ListingsService.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

import Foundation

class ListingsService: ListingsServiceProtocol {
    
    private let client: HTTPClient

    init(client: HTTPClient = .shared) {
        self.client = client
    }

    func fetchListings() async throws -> [ClassifiedAd] {
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        return try await client.doRequest(request: request)
    }
    
}
