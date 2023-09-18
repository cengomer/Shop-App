//
//  ProfileView.swift
//  ShopingApp
//
//  Created by omer elmas on 13.07.2023.
//

import SwiftUI

struct ProfileView: View {
    let settings = [
        "Cards" : "creditcard" ,
        "Address" : "mappin.and.ellipse" ,
        "Account Settings" : "gearshape" ,
        "Change Number" : "phone" ,
        "Last Purchases" : "purchased"
    ]

    var body: some View {
        NavigationView {
            NavigationStack {
                
       
                VStack {
                    
                    Form {
                        Section("Personal Information") {
                            VStack(alignment: .center){
                                
                                    Image(systemName: "person")
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .frame(width: 100, height: 100)
                                        .background(Color(.systemGray5))
                                        .clipShape(Circle())
                                        .foregroundColor(.gray)
                                        .padding(.bottom , -4)
                                    VStack(alignment: .center){
                                        Text("Omer Elmas")
                                            .font(.largeTitle)
                                            .fontWeight(.semibold)
                                        
                                        Text("Turkey | Istnabul")
                                            .font(.callout)
                                            .fontWeight(.medium)
                                            .padding(.bottom , 2)
                                        Text("+ 123 45 678 90")
                                            .font(.callout)
                                            .fontWeight(.medium)
                                    }
                                
                                    
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Section("General Settings") {
                           
                                ForEach(settings.sorted(by: { $0.key < $1.key }), id: \.key) { key, imageName in
                                    HStack {
                                        Image(systemName: imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        Text(key)
                                    }
                                }
                            

                        
                        }
                    }
                }
            }
            .navigationTitle("Profile Settings")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}
