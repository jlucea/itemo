
import Foundation
import OSLog

/// ViewModel responsible for loading and managing the state of product categories.
class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Int:String] = [:]
    @Published var isLoading = true
    @Published var error: Error?

    private let repository = CategoriesRepository()

    private let logger = Logger()
    
    init() {
        Task {
            await loadCategories()
        }
    }
    
    init(categories: [Int:String]) {
        self.categories = categories
    }

    /// Loads categories from the repository and updates the view state.
    @MainActor
    private func loadCategories() async {
        do {
            self.isLoading = true
            categories = try await repository.loadCategories()
        } catch {
            self.error = error
            logger.error("Failed to load categories: \(error.localizedDescription)")
        }
        self.isLoading = false
    }
    
}
