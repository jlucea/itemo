//
//  MockCategoriesService.swift
//  Itemo
//
//  Created by Jaime Lucea on 1/5/25.
//

import Foundation
@testable import Itemo

typealias ItemCategory = Itemo.Category

final class MockCategoriesService: CategoriesServiceProtocol {
    
    var stubbedCategories: [ItemCategory] = [
        ItemCategory(id: 1, name: "Electronics"),
        ItemCategory(id: 2, name: "Clothing"),
        ItemCategory(id: 3, name: "Books")
    ]
    
    var fetchCalled: Bool = false

    func fetchCategories() async throws -> [ItemCategory] {
        fetchCalled = true
        return stubbedCategories
    }
}
