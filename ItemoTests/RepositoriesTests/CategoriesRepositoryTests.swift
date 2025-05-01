//
//  CategoriesRepositoryTests.swift
//  Itemo
//
//  Created by Jaime Lucea on 1/5/25.
//

import Foundation
import Testing
@testable import Itemo

@Suite
struct CategoriesRepositoryTests {
    
    @Test
    func handlesCacheAndFetchCorrectly() async throws {
        let service = MockCategoriesService()
        let repository = CategoriesRepository(service: service)
        repository.clearCache()

        // Case 1: Cache is empty, should fetch from service
        let result1 = try await repository.loadCategories()
        #expect(service.fetchCalled)
        #expect(result1 == [1: "Electronics", 2: "Clothing", 3: "Books"])

        // Reset the flag and now test cached load
        service.fetchCalled = false
        let result2 = try await repository.loadCategories()
        #expect(!service.fetchCalled)
        #expect(result2 == result1)
    }
    
}
