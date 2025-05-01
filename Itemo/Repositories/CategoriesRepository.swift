
import Foundation

/// A repository responsible for loading product categories from cache or service
class CategoriesRepository {
    
    private let service: CategoriesServiceProtocol
    private let cacheKey = "CachedCategories"
    
    init(service: CategoriesServiceProtocol = CategoriesService()) {
        self.service = service
    }

    /// Loads categories from cache if available; otherwise fetches from network.
    func loadCategories() async throws -> [Int:String] {
        // Try cache first
        if let cachedCategories = loadCachedCategories() {
            return cachedCategories
        }

        // Otherwise fetch
        let categories = try await service.fetchCategories()
        
        // Reduce the fetched array into the published dictionary
        let categoriesDictionary = categories.reduce(into: [:]) { result, category in
            result[category.id] = category.name
        }
        
        // Store in cache
        cache(categoriesDictionary)
        return categoriesDictionary
    }

    /// Attempts to retrieve cached categories from UserDefaults.
    func loadCachedCategories() -> [Int:String]? {
        guard let data = UserDefaults.standard.data(forKey: cacheKey),
              let decoded = try? JSONDecoder().decode([Int:String].self, from: data) else {
            return nil
        }
        return decoded
    }

    /// Saves categories to UserDefaults for caching.
    func cache(_ categories: [Int:String]) {
        if let data = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(data, forKey: cacheKey)
        }
    }
    
    func clearCache() {
        UserDefaults.standard.removeObject(forKey: cacheKey)
    }
    
}
