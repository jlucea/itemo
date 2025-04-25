
import SwiftUI

/// A view that displays a single classified ad with its image, price, title, and category.
struct ListingItemView: View {
    
    let ad: ClassifiedAd
    
    @EnvironmentObject var categoriesVM: CategoriesViewModel  // View model to fetch categories
    
    var body: some View {
        GeometryReader { container in
            VStack(alignment: .leading, spacing: 10) {
                
                //MARK: Image
                ZStack(alignment: .topTrailing) {
                    GeometryReader { imageContainer in
                        AsyncImage(url: URL(string: ad.imagesURL.small ?? "")) { phase in
                            switch phase {
                            case .empty:
                                Color.gray.opacity(0.1)
                                    .overlay(ProgressView())    // Show loading progress
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()     // Ensures the image fills the space
                                    .frame(width: imageContainer.size.width, height: imageContainer.size.height)
                                    .clipped()
                            case .failure:
                                Color.gray.opacity(0.1)
                                    .overlay(Image(systemName: "photo"))
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .cornerRadius(12)
                    }
                    .frame(height: container.size.height * 3 / 4)   // Top: Image (3/4 of the total height)
                    
                    //MARK: Urgent Badge
                    if ad.isUrgent {
                        UrgentBadge()
                            .frame(width: 86, height: 24)
                            .padding(8)
                    }
                }
                // MARK: Description
                VStack(alignment: .leading, spacing: 6)  {
                    Text(ad.price.description + " €")
                        .font(.title2)
                    
                    Text(ad.title)
                        .font(.body)
                                        
                    Text(categoriesVM.categories[ad.categoryId] ?? "")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(.purple)
                }
                .padding(8)
                .frame(height: container.size.height * 1 / 4)
            }
        }
    }
}

//MARK: - Preview

#Preview {
    let mockCategories: [Int:String] = [5:"Toys, games & collectibles"]
    
    let mock = ClassifiedAd(
        id: 19,
        title: "Faucon Millenium Star Wars Lego",
        categoryId: 4,
        creationDate: "2022-03-01T10:00:00+0000",
        description: "Faucon Millenium Star Wars Lego (7965) Quasiment complet (manque juste 2 pièces au niveau de la cabine) Fourni avec tous les personnages + 5 personnages supplémentaires qui ne font pas partie initialement de la boite Fourni avec la notice complète en 2 parties Fourni sans la boite d’origine A venir chercher à Paris 17 (ce que nous privilégions) Livraison possible (frais d’envoi à prévoir en plus)",
        isUrgent: true,
        imagesURL: ImagesURL(
            small: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/0fbc79bc13bac33cf47a7610a3732498e964c009.jpg",
            thumb: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/0fbc79bc13bac33cf47a7610a3732498e964c009.jpg"),
        price: 75, siret: nil)
        
    ListingItemView(ad: mock)
        .environmentObject(CategoriesViewModel(categories: mockCategories))
        .frame(height: 320)
        .padding(.horizontal, 100)
}
