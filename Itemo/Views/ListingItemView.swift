
import SwiftUI

struct ListingItemView: View {
    
    @EnvironmentObject var categoriesVM: CategoriesViewModel
    
    let ad: ClassifiedAd
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // MARK: Image
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
            .frame(height: 240)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
                        
            // MARK: Price and description
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
            .padding(.leading, 5)
            
            Spacer()
        }
        
    }
}

//MARK: - Preview

#Preview {
    
    let mock = ClassifiedAd(
        id: 19,
        title: "Test",
        categoryId: 4,
        creationDate: "2022-03-01T10:00:00+0000",
        description: "Test description",
        isUrgent: false,
        imagesURL: ImagesURL(
            small: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/0fef594d0cf8689fd6f511ed6d3ce365f6707af4.jpg",
            thumb: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/0fef594d0cf8689fd6f511ed6d3ce365f6707af4.jpg"),
        price: 70,
        siret: "123 456 789"
    )
    
    let mockCategories: [Int:String] = [4:"Random"]
    
    ListingItemView(ad: mock)
        .frame(width: 200, height: 400)
        .environmentObject(CategoriesViewModel(categories: mockCategories))
}
