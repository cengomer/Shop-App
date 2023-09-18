//
//  ClothesItemsView.swift
//  ShopingApp
//
//  Created by omer elmas on 10.07.2023.
//

import SwiftUI

struct ClothesItemsView: View {
    let item: ClothingItem
    
    @State private var isFavorite = false
    @EnvironmentObject var order: Order

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 290)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Circle()
                    .frame(width: 44, height: 44)
                    .padding()
                    .foregroundColor(isFavorite ? .orange : .white)
                
                withAnimation {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 22, height: 20)
                        .foregroundColor(!isFavorite ? .orange : .white)
                        .scaledToFit()
                        .padding(27.5)
                        .onTapGesture {
                            isFavorite.toggle()
                            if isFavorite {
                                order.addToFavorites(item: item)
                            } else {
                                order.removeFromFavorites(item: item)
                            }
                        }
                }
            }
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.title2)
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                
                Text("$\(String(format: "%.2f", item.price))")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
        .onAppear {
                    isFavorite = order.favoriteItems.contains(item)
                }
    }
}


struct ClothesItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ClothesItemsView(item: ClothingItem(id: "F58A55B2-C2C6-48C3-A8F1-759B77017363", name: "Omer Elmas", price: 89.3, image: "item5", rate: 3, description: "nothing", category: "Men"))
    }
}
