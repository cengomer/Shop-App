//
//  Order.swift
//  ShopingApp
//
//  Created by omer elmas on 13.07.2023.
//

import SwiftUI

class Order: ObservableObject {
    @Published var cartItems = [ClothingItem]()
    @Published var favoriteItems = [ClothingItem]()
    
    var total: Double {
        if cartItems.count > 0 {
            return cartItems.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }
    
    func addToCart(item: ClothingItem) {
        cartItems.append(item)
    }
    
    func addToFavorites(item: ClothingItem) {
        favoriteItems.append(item)
    }
    
    func removeFromFavorites(item: ClothingItem) {
        if let index = favoriteItems.firstIndex(of: item) {
            favoriteItems.remove(at: index)
        }
    }
    
    func remove(item: ClothingItem) {
        if let index = cartItems.firstIndex(of: item) {
            cartItems.remove(at: index)
        }
    }
}

/*
 class Order: ObservableObject {
     @Published var items = [ClothingItem]()
     
     var total: Double {
         if items.count > 0 {
             return items.reduce(0) { $0 + $1.price}
         } else {
             return 0
         }
     }
     
     func add(item: ClothingItem) {
         items.append(item)
     }
     
   
     
     func remove(item: ClothingItem) {
         if let index = items.firstIndex(of: item) {
             items.remove(at: index)
         }
     }
 }
 */
