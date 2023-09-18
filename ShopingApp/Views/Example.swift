//
//  TabView.swift
//  ShopingApp
//
//  Created by omer elmas on 11.07.2023.
//

import SwiftUI

enum Tab: String , CaseIterable {
    case house
    case heart
    case cart
    case person
}

struct Example: View {
    @Binding var selectedTab: Tab
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases , id:\.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.35 : 1.35)
                        .foregroundColor(selectedTab == tab ? .orange : .gray)
                        .font(.system(size: 22))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                            
                        }
                    
                    Spacer()
                }
            }
            .frame(width: nil, height: 90)
            .background(.black)
            .clipShape(Capsule())
            .cornerRadius(10)
            .padding()
          
        }
     
    }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        Example(selectedTab: .constant(.heart))
            .environmentObject(Order())
    }
}
