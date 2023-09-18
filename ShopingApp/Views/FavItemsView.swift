//
//  FavItemsView.swift
//  ShopingApp
//
//  Created by omer elmas on 13.07.2023.
//

import SwiftUI

struct FavItemsView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.favoriteItems) { item in
                        HStack {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(item.name)
                            Spacer()
                            Text("\(item.price.toCurrency())")
                            
                            Button(action: {
                                order.addToCart(item: item)
                            }) {
                                Image(systemName: "cart.badge.plus")
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorite Items")
        }
    }
}


struct FavItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FavItemsView()
                .environmentObject(Order())
        }

    }
}
