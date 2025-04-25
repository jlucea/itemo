
import SwiftUI

struct ClassifiedAdDetailView: View {
    
    @State var ad: ClassifiedAd
    
    @EnvironmentObject var categoriesVM: CategoriesViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                
                ZStack(alignment: .topTrailing) {
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
                    .frame(height: 380, alignment: .top)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    
                    if ad.isUrgent {
                        UrgentBadge()
                            .frame(width: 86, height: 24)
                            .padding(12)
                    }
                }
                
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
    
    let mockCategories: [Int:String] = [4:"Toys, games & collectibles"]
    
    let ad = ClassifiedAd(
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
    
    return ClassifiedAdDetailView(ad: ad)
                .environmentObject(CategoriesViewModel(categories: mockCategories))
}
