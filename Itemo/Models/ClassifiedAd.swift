//
//  Item.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

struct ClassifiedAd: Codable, Identifiable {
    
    let id: Int
    let title: String
    let categoryId: Int
    let creationDate: String
    let description: String
    let isUrgent: Bool
    let imagesURL: ImagesURL
    let price: Int
    let siret: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case categoryId = "category_id"
        case creationDate = "creation_date"
        case description
        case isUrgent = "is_urgent"
        case imagesURL = "images_url"
        case price
        case siret
    }
    
}

struct ImagesURL: Codable {
    let small: String?
    let thumb: String?
}

