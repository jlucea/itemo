
import Foundation
import OSLog

class CategoriesService {
    
    private let client: HTTPClient = .shared
    private let categoriesEndpoint = "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"
    private var logger = Logger()
    
    /// Fetches a list of categories from the remote JSON endpoint.
    ///
    /// - Returns: An array of `Category` objects.
    /// - Throws: An error if the URL is invalid or the request fails.
    func fetchCategories() async throws -> [Category] {
        guard let url = URL(string: categoriesEndpoint) else {
            logger.error("Invalid URL: \(self.categoriesEndpoint)")
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let categories: [Category] = try await client.doRequest(request: request)
        
        logger.debug("Fetched \(categories.count) categories.")
        return categories
    }
    
}
