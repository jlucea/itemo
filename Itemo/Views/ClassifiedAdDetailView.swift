
import SwiftUI

struct ClassifiedAdDetailView: View {
    
    @State var ad: ClassifiedAd
    
    @EnvironmentObject var categoriesVM: CategoriesViewModel
    
    var body: some View {
        ScrollView {
            VStack (alignment: .center) {
                ZStack(alignment: .topTrailing) {
                    //MARK: Item image
                    AsyncImage(url: URL(string: ad.imagesURL.thumb ?? "")) { phase in
                        switch phase {
                        case .empty:
                            Color.gray.opacity(0.1)
                                .overlay(ProgressView())    // Show loading progress
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                        case .failure:
                            Color.gray.opacity(0.1)
                                .overlay(Image(systemName: "photo"))
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    if ad.isUrgent {
                        UrgentBadge()
                            .frame(width: 86, height: 24)
                            .padding(12)
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.4)

                //MARK: Item description
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(ad.price) €")
                        .font(.customTitle)

                    Text(ad.title)
                        .font(.customTitle)
                    
                    Text(categoriesVM.categories[ad.categoryId] ?? "")
                        .font(.customCaption)
                        .fontWeight(.semibold)
                        .foregroundStyle(.purple)
                    
                    Divider().padding(.vertical, 12)
                    
                    Text(ad.description)
                        .font(.customBody)
                }
                .padding(.horizontal, 16)
                .padding(.top, 18)
                .frame(maxWidth: .infinity)
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
            thumb: "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/0fbc79bc13bac33cf47a7610a3732498e964c009.jpg"),
        price: 75, siret: nil)
    
    return ClassifiedAdDetailView(ad: ad)
                .environmentObject(CategoriesViewModel(categories: mockCategories))
}
