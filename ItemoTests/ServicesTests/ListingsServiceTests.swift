//
//  ListingsServiceTests.swift
//  Itemo
//
//  Created by Jaime Lucea on 1/5/25.
//

import Testing
@testable import Itemo

@Suite
struct ListingsServiceTests {
    
    @Test
    func fecthListingsReturnsData() async throws {
        
        let results = try await ListingsService().fetchListings()
        
        #expect(!results.isEmpty)
    }
}
