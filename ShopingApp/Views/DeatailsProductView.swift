//
//  DeatailsProductView.swift
//  ShopingApp
//
//  Created by omer elmas on 11.07.2023.
//

import SwiftUI

struct DeatailsProductView: View {
    let item: ClothingItem
    @State private var itemNumber = 1
    @State private var selectedSize: String = ""
    
    @EnvironmentObject var order : Order
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 230)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(36)
                            .padding(.bottom, -10)
                          
                        
                        HStack(spacing: -8) {
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 190, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.horizontal)
                            
                            Image(item.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 190, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .padding(.horizontal)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text(item.name)
                                .frame(width: .infinity, height: 70)
                                .font(.title)
                                .fontWeight(.semibold)
                                .lineLimit(2)
                                .padding(.vertical)
                            
                            Spacer()
                            
                            VStack {
                                Text("Best Seller")
                                    .foregroundColor(.orange)
                                
                                Text("\(item.price.toCurrency())")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.horizontal , 36)
                        .padding(.bottom, -40)
                        
                        HStack {
                            HStack {
                                ForEach(0..<item.rate, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.orange)
                                }
                                
                                Text("\(item.rate)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                            }
                            .padding(.horizontal , 36)
                            .padding(.top , 20)
                            
                            Spacer()
                            
                            HStack {
                                Text("-")
                                    .font(.largeTitle)
                                    .frame(width: 30, height: 30)
                                    .background(Color(.systemGray5))
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        if itemNumber > 0 {
                                            itemNumber -= 1
                                        }
                                    }
                                
                                Text("\(itemNumber)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text("+")
                                    .font(.title)
                                    .frame(width: 30, height: 30)
                                    .background(Color(.systemGray5))
                                    .foregroundColor(.black)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        itemNumber += 1
                                    }
                            }
                            .padding(.horizontal , 36)
                            .padding(.top , 20)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(item.description)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .frame(height: 90)
                                .padding(.bottom, -20)
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                ForEach(["S", "M", "L", "XL", "XXL"], id: \.self) { size in
                                    Text(size)
                                        .font(.title3)
                                        .frame(width: 38, height: 38)
                                        .padding()
                                        .foregroundColor(size == selectedSize ? .white : .primary)
                                        .background(size == selectedSize ? .black : Color(.systemGray5))
                                        .clipShape(Circle())
                                        .onTapGesture {
                                            selectedSize = size
                                        }
                                }
                            }
                            .padding()
                            
                            Button {
                                order.addToCart(item: item)
                            } label: {
                                Text("Add to cart")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .frame(width: 400, height: 70)
                                    .background(.orange)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                                    .padding(.bottom, 90)
                                    .padding(.horizontal)
                            }

                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top) // Add top padding to separate the content from the navigation bar title
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        // Add menu items here...
                    } label: {
                        Image(systemName: "ellipsis")
                            .imageScale(.large)
                            .foregroundColor(.black)

                    }
                }
            }
            
            .navigationTitle("Details Product")
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
}

struct DeatailsProductView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DeatailsProductView(item: ClothingItem(id:"12",name: "Jeans", price: 20.0, image: "item7", rate: 5, description: "noting" , category: "All"))
                .environmentObject(Order())
        }
    }
}
