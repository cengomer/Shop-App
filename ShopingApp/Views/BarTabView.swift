//
//  TabView.swift
//  ShopingApp
//
//  Created by omer elmas on 11.07.2023.
//

import SwiftUI

struct BarTabView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
        var body: some View {
            NavigationView {
                ZStack {
                    VStack {
                        TabView(selection: $selectedTab) {
                            if selectedTab == .house {
                                ShoppingView()
                                    .animation(nil, value: selectedTab)
                            } else if selectedTab == .cart {
                                OrderView()
                                    .animation(nil, value: selectedTab)

                            } else if selectedTab == .heart {
                                FavItemsView()
                                    .animation(nil, value: selectedTab)

                            }
                            else if selectedTab == .person {
                                ProfileView()
                                    .animation(nil, value: selectedTab)

                            }
                          
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Example(selectedTab: $selectedTab)
                    }
                }
            }
            
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BarTabView()
            .environmentObject(Order())
    }
}
