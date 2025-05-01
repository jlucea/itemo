
protocol CategoriesServiceProtocol {
    
    func fetchCategories() async throws -> [Category]
    
}
