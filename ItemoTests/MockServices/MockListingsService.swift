//
//  MockListingsService.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

final class MockListingsService: ListingsServiceProtocol {
    
    func fetchListings() async throws -> [ClassifiedAd] {
        return [ClassifiedAd(
                    id: 1,
                    title: "Vintage Lamp",
                    categoryId: 2,
                    creationDate: "2022-03-01T10:00:00+0000",
                    description: "A beautiful vintage lamp, barely used.",
                    isUrgent: true,
                    imagesURL: ImagesURL(
                        small: "https://via.placeholder.com/100x100.png?text=Lamp",
                        thumb: "https://via.placeholder.com/200x200.png?text=Lamp"
                    ),
                    price: 120,
                    siret: "123 456 789"
                ),
                ClassifiedAd(
                    id: 2,
                    title: "Mountain Bike",
                    categoryId: 3,
                    creationDate: "2022-03-02T14:00:00+0000",
                    description: "Well-maintained, 21-speed mountain bike.",
                    isUrgent: false,
                    imagesURL: ImagesURL(
                        small: "https://via.placeholder.com/100x100.png?text=Bike",
                        thumb: "https://via.placeholder.com/200x200.png?text=Bike"
                    ),
                    price: 300,
                    siret: ""
                )
            ]
    }
    
}
