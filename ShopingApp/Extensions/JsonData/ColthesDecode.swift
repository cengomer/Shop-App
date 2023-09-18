import SwiftUI

struct ClothingItem: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let price: Double
    let image: String
    let rate: Int
    let description: String
    let category: String
}

struct ClothingData: Codable {
    let items: [ClothingItem]
}

class ClothingDataManager: ObservableObject {
    @Published var clothingItems: [ClothingItem] = []
    
    private var selectedCategoryIndex = 0
    
    func getFilteredClothingItems(forCategoryIndex index: Int) -> [ClothingItem] {
        let category = getCategoryName(for: index)
        return category == "All" ? clothingItems : clothingItems.filter { $0.category == category }
    }
    
    private func getCategoryName(for index: Int) -> String {
        let categories = ["All", "Newest", "Popular", "Men", "Women"]
        return categories[index]
    }
    
    static func loadClothingItems() -> [ClothingItem]? {
        guard let url = Bundle.main.url(forResource: "ClothesData", withExtension: "json") else {
            print("JSON file not found in bundle")
            return nil
        }
        
        
        do {
            let jsonData = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try jsonDecoder.decode(ClothingData.self, from: jsonData)
            
            print("Successfully loaded clothing items:")
            for item in decodedData.items {
                print(item)
            }
            
            return decodedData.items
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }


}
