//
//  SearchBar.swift
//  ShopingApp
//
//  Created by omer elmas on 14.07.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var isFirstResponder: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $text)
                .foregroundColor(.primary)
                .onAppear {
                    if isFirstResponder {
                        becomeFirstResponder()
                    }
                }
            
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .opacity(text.isEmpty ? 0 : 1)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemGray6))
    }

    private func becomeFirstResponder() {
        DispatchQueue.main.async {
            let textField = UITextField()
            textField.becomeFirstResponder()
        }
    }
}


