//
//  DetailProductViewModel.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import Foundation

protocol DetailProductViewModelProtocol {
    var title: String { get }
    var imageData: Data? { get }
    var description: String { get }
    var category: String { get }
    var price: String { get }
    var isFavorite: Bool { get }
    init(product: Product)
    func didTapFavoriteButton()
}

class DetailProductViewModel: DetailProductViewModelProtocol, ObservableObject {
    
    private let product: Product
    
    var title: String {
        product.title
    }
    
    var imageData: Data? {
        try? Data(contentsOf: self.product.image)
    }
    
    var description: String {
        "Description: \(product.description)"
    }
    
    var category: String {
        "Category: \(product.category)"
    }
    
    var price: String {
        "Price: \(product.price)"
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.setFavoriteStatus(productTitle: product.title, status: isFavorite)
        }
    }
    
    func didTapFavoriteButton() {
        isFavorite.toggle()
    }
    
    required init(product: Product) {
        self.product = product
        isFavorite = DataManager.shared.getFavoriteStatus(productTitle: product.title)
    }
}
