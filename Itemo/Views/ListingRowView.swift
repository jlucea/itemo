//
//  ListingRowView.swift
//  Itemo
//
//  Created by Jaime Lucea on 18/4/25.
//

import SwiftUI

struct ListingRowView: View {
    
    let listing: ClassifiedAd
    
    var body: some View {
        Text(listing.title)
            .font(.headline)
    }
}

#Preview {
    
    let mock = ClassifiedAd(
        id: 19,
        title: "Test",
        categoryId: 4,
        creationDate: "2022-03-01T10:00:00+0000",
        description: "Test description",
        isUrgent: false,
        imagesURL: ImagesURL(
            small: "https://example.com/small.jpg",
            thumb: "https://example.com/thumb.jpg"),
        price: 70,
        siret: "123 456 789"
    )
    
    ListingRowView(listing: mock)
}

