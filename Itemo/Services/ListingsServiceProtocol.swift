//
//  ListingsServiceProtocol.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

protocol ListingsServiceProtocol {
    
    func fetchListings() async throws -> [ClassifiedAd]
    
}
