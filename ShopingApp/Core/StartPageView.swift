import SwiftUI

struct StartPageView: View {
    @State private var isShowingSheet = true
 
    let v1 = ["img3", "img7", "img4"]
    let v2 = ["img1", "img2", "img5"]
    let v3 = ["img6", "img8", "img9"]

    var body: some View {
        ZStack {
            Color(.systemGray5)
            
            VStack {
            
                
                ZStack {
                    HStack(spacing: -70) {
                        VStack {
                            ForEach(v1, id: \.self) { img in
                                Image("\(img)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .frame(width: 400, height: 400)
                            }
                        }
                        
                        VStack {
                            ForEach(v2, id: \.self) { img in
                                Image("\(img)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .frame(width: 300, height: 300)
                            }
                        }
                        
                        VStack {
                            ForEach(v3, id: \.self) { img in
                                Image("\(img)")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                    .frame(width: 400, height: 400)
                            }
                        }
                    }
                    
               
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.25)
                )
                
                
            }
            .padding(.top, 16)
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $isShowingSheet) {
            GetStartedPage()
                .presentationDetents([.height(400)])
        }
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}
