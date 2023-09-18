//
//  ShopingAppApp.swift
//  ShopingApp
//
//  Created by omer elmas on 9.07.2023.
//

import SwiftUI

@main
struct ShopingAppApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
