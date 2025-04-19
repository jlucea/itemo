//
//  ItemoTests.swift
//  ItemoTests
//
//  Created by Jaime Lucea on 18/4/25.
//

import Testing
import Foundation
@testable import Itemo

struct ItemoTests {

    @Test func fetcheAndDecodeData() async throws {
        let service = ListingsService()
        let listings = try await service.fetchListings()
        
        #expect(listings.count > 0)
    }
    
    
    @Test
    func parsesListingCorrectly() throws {
        let json = """
        {
          "id": 1,
          "title": "Vintage lamp",
          "category_id": 2,
          "creation_date": "2022-03-01T10:00:00+0000",
          "description": "A beautiful vintage lamp.",
          "is_urgent": true,
          "images_url": {
            "small": "https://example.com/small.jpg",
            "thumb": "https://example.com/thumb.jpg"
          },
          "price": 120,
          "siret": "123 456 789"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let listing = try decoder.decode(ClassifiedAd.self, from: json)

        #expect(listing.id == 1)
        #expect(listing.title == "Vintage lamp")
        #expect(listing.categoryId == 2)
        #expect(listing.isUrgent == true)
        #expect(listing.imagesURL.small == "https://example.com/small.jpg")
        #expect(listing.price == 120)
        #expect(listing.siret == "123 456 789")
    }
    
}
