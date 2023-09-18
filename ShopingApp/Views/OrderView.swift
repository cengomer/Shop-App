//
//  OrderView.swift
//  ShopingApp
//
//  Created by omer elmas on 13.07.2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.cartItems) { item in
                        HStack {
                            
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            
                            Text(item.name)
                            Spacer()
                            Text("\(item.price.toCurrency())")
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                Section {
                    
                    
                    NavigationLink("Place Order") {
                        CheckotView()
                    }
                }
                .disabled(order.cartItems.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        order.cartItems.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
