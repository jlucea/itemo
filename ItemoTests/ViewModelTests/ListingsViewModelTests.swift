//
//  ListingsViewModelTests.swift
//  Itemo
//
//  Created by Jaime Lucea on 1/5/25.
//
import Foundation
import Testing
@testable import Itemo

@Suite
struct ListingsViewModelTests {
    
    @Test
    func loadsListingsSuccessfully() async throws {
        let mockService = MockListingsService()
        let viewModel = await ListingsViewModel(service: mockService)

        await viewModel.loadData()

        await #expect(viewModel.listings.count == 2)
        await #expect(viewModel.listings.first?.title == "Vintage Lamp")
    }
    
}
