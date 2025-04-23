//
//  ClassifiedAdDetailView.swift
//  Itemo
//
//  Created by Jaime Lucea on 19/4/25.
//

import SwiftUI

struct ClassifiedAdDetailView: View {
    
    @State var ad: ClassifiedAd
    
    @EnvironmentObject var categoriesVM: CategoriesViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                //MARK: Item image(s)
                AsyncImage(url: URL(string: ad.imagesURL.thumb ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                    case .failure(_):
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 80)
                            .clipped()
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 380)
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
                
                //MARK: Item description
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(ad.price) €")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(ad.title)
                        .font(.title2)
                    
                    Text(categoriesVM.categories[ad.categoryId] ?? "")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(.purple)
                    
                    Divider().padding(.vertical, 12)
                    
                    Text(ad.description)
                        .font(.body)
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                
                Spacer()
            }
        }
    }
}

//MARK: - Preview

#Preview {
    
    let json = """
    {
      "id":1701863171,
      "category_id":5,
      "title":"Faucon Millenium Star Wars Lego",
      "description":"Faucon Millenium Star Wars Lego (7965) Quasiment complet (manque juste 2 pièces au niveau de la cabine) Fourni avec tous les personnages + 5 personnages supplémentaires qui ne font pas partie initialement de la boite Fourni avec la notice complète en 2 parties Fourni sans la boite d’origine A venir chercher à Paris 17 (ce que nous privilégions) Livraison possible (frais d’envoi à prévoir en plus)",
      "price":75.00,
      "images_url":{
         "small":"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/0fbc79bc13bac33cf47a7610a3732498e964c009.jpg",
         "thumb":"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/0fbc79bc13bac33cf47a7610a3732498e964c009.jpg"
      },
      "creation_date":"2019-11-05T15:55:08+0000",
      "is_urgent":false
    }
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    decoder.dateDecodingStrategy = .iso8601

    let ad: ClassifiedAd
    do {
        ad = try decoder.decode(ClassifiedAd.self, from: json)
        print("Decoded ad: \(ad)")
    } catch {
        fatalError("Failed to decode ad: \(error)")
    }
    
    let mockCategories: [Int:String] = [5:"Toys, games & collectibles"]
    
    return ClassifiedAdDetailView(ad: ad)
                .environmentObject(CategoriesViewModel(categories: mockCategories))
}
