//
//  DetailProductView.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import SwiftUI

struct DetailProductView: View {
    
    @StateObject var viewModel: DetailProductViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text(viewModel.title)
                .font(.largeTitle)
                .padding()
            GeometryReader { geometry in
                ImageProductView(imageData: viewModel.imageData,
                                 imageSize: CGSize(width: 300, height: 250),
                                 radius: 10)
                FavoriteButton(isFavorite: viewModel.isFavorite) {
                    viewModel.didTapFavoriteButton()
                }
                .position(x: geometry.size.width - 20, y: geometry.size.height - 20)
            }
            .frame(width: 300, height: 250)
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.description)
                Text(viewModel.category)
                Text(viewModel.price)
            }
            .font(.headline)
            .padding()
            Spacer()
        }
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(viewModel: DetailProductViewModel(product: Product.getProduct()))
    }
}
