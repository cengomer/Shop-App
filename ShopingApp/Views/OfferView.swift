//
//  OfferView.swift
//  ShopingApp
//
//  Created by omer elmas on 10.07.2023.
//

import SwiftUI

struct OfferView: View {
    var body: some View {
        ZStack{
            
            Image("offer")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.4)
                )
            
            VStack (alignment: .leading){
                HStack{
                    Text("Get your special\nsale up to 50%")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 300, height: 100)
                    Spacer()
                }
                
                Text("Shop now!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 170, height: 70))
                    .frame(width: 150, height: 40)
                    .clipShape(Capsule())
                    .padding(.horizontal , 30)

            }
            
        }
       
    }
}

struct OfferView_Previews: PreviewProvider {
    static var previews: some View {
        OfferView()
    }
}
