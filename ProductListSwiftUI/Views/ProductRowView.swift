//
//  ProductRowView.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import SwiftUI

struct ProductRowView: View {
    
    let viewModel: DetailProductViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            ImageProductView(imageData: viewModel.imageData,
                             imageSize: CGSize(width: 100, height: 80),
                             radius: 0)
            Text(viewModel.title)
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: DetailProductViewModel(product: Product.getProduct()))
    }
}
