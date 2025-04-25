
import SwiftUI

/// The main view for displaying a list of classified ads.
struct ListingsView: View {
    
    @StateObject var viewModel = ListingsViewModel()

    // This adaptive layout configures grid items to have a flexible width.
    private let adaptiveLayout: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200, maximum: 400)), count: 2)
    
    //MARK: Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: adaptiveLayout, spacing: 30) {     // Vertical spacing
                    ForEach (viewModel.listings, id: \.id) { ad in
                        NavigationLink(
                            // When a listing is tapped, navigate to the ad details page.
                            destination:
                                ClassifiedAdDetailView(ad: ad),
                            label: {
                                // ListingItemView displays the individual ad in the grid.
                                ListingItemView(ad: ad)
                                    .frame(height: 320)
                            })
                        .buttonStyle(.plain)
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .padding(10)
            .navigationTitle("Listings")
            .task {
                // Loads the classified ads data when the view appears.
                await viewModel.loadData()
            }
        }
    }
}

//MARK: - Preview

#Preview {
    let mockCategories: [Int:String] = [4:"Random"]
    ListingsView()
        .environmentObject(CategoriesViewModel(categories: mockCategories))
}
