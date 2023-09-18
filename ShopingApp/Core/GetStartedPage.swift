import SwiftUI

struct GetStartedPage: View {
    @State private var currentPage = 0
    @State private var isShowingShopingView = false

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                VStack {
                    Text("Start Finding Your Version The Best Fashion Style")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Your appearance shows your quality so give your best for your best fashion")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(8)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .tag(0)
                
                VStack {
                    Text("Embark on a Journey to Discover Your Perfect Fashion Identity")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Unlock Your Fashion Potential: Find Your Signature Style")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(8)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .tag(1)
                
                VStack {
                    Text("Elevate Your Fashion Sense and Define Your Personal Style")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Step Into the Spotlight: Uncover Your Unique Fashion Persona")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(8)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .tag(2)
            }
            .background(Color.black)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action: {
                isShowingShopingView = true
            }) {
                Text("Get started")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 350, height: 70)
                    .background(.orange)
                    .cornerRadius(40)
            }
            .padding()
            .fullScreenCover(isPresented: $isShowingShopingView) {
                BarTabView()
            }
        }
        .background(.black)
    }
}



struct GetStartedPage_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedPage()
    }
}
