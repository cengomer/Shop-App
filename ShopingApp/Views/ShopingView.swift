import SwiftUI

struct ShoppingView: View {
    @StateObject private var dataManager = ClothingDataManager()
    @State private var selectedCategoryIndex = 0
    @State private var searchText = ""
    @State private var isSearchBarActive = false

    var filteredClothingItems: [ClothingItem] {
        if searchText.isEmpty {
            return dataManager.getFilteredClothingItems(forCategoryIndex: selectedCategoryIndex)
        } else {
            return dataManager.clothingItems.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        HStack {
                            Image(systemName: "diamond.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                            
                            Text("ELMAS")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                                .padding(.horizontal)
                                .onTapGesture {
                                    isSearchBarActive.toggle()
                                }
                            
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44, height: 44)
                        }
                        .padding(20)
                        
                        if isSearchBarActive {
                        SearchBar(text: $searchText, isFirstResponder: true)
                        .padding(.bottom, 20)
                                             }
                        
                        OfferView()
                        
                        CategoryNamesView(selectedCategoryIndex: $selectedCategoryIndex)
                        
                        VStack(alignment: .leading) {
                            ScrollView(showsIndicators: false) {
                                LazyVGrid(columns: [
                                    GridItem(.flexible(), spacing: 16),
                                    GridItem(.flexible(), spacing: 16)
                                ], spacing: 16) {
                                    ForEach(filteredClothingItems) { item in
                                        NavigationLink(destination: DeatailsProductView(item: item))
                                        {
                                            ClothesItemsView(item: item)
                                        }
                                        

                                    }

                                    
                                    if filteredClothingItems.isEmpty {
                                        Text("No items found")
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                VStack {
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                if let clothingItems = ClothingDataManager.loadClothingItems() {
                    dataManager.clothingItems = clothingItems
                }
                print("Clothing Items Count:", dataManager.clothingItems.count)
            }
        }
        
    }
}


struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
