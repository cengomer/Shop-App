import SwiftUI

struct CategoryNamesView: View {
    @Binding var selectedCategoryIndex: Int

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 33) {
                ForEach(categoryNames, id: \.self) { category in
                    Button(action: {
                        if let index = categoryNames.firstIndex(of: category) {
                            selectedCategoryIndex = index
                        }
                    }) {
                        Text(category)
                            .font(.title3)
                            .fontWeight(selectedCategoryIndex == categoryNames.firstIndex(of: category) ? .medium : .regular)
                            .foregroundColor(selectedCategoryIndex == categoryNames.firstIndex(of: category) ? .black : .gray)
                    }
                    .overlay(
                        selectedCategoryIndex == categoryNames.firstIndex(of: category) ?
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(.black)
                                .padding(.top, 30)
                            : nil
                    )
                }
            }
            .padding()
        }
    }

    private let categoryNames = ["All", "Newest", "Popular", "Men", "Women"]
}
struct CategoryNamesView_Previews: PreviewProvider {
    @State static var selectedCategoryIndex = 0

    static var previews: some View {
        CategoryNamesView(selectedCategoryIndex: $selectedCategoryIndex)
    }
}
