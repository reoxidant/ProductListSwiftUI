//
//  ProductListViewModel.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 01.01.2022.
//

import Foundation

protocol ProductListViewModelProtocol {
    var listRows: [DetailProductViewModel] { get }
    func fetchListRows()
}

class ProductListViewModel: ProductListViewModelProtocol, ObservableObject {
    @Published var listRows = [DetailProductViewModel]()
    
    func fetchListRows() {
        NetworkManager.shared.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                products.forEach { [weak self] product in
                    let detailViewModel = DetailProductViewModel(product: product)
                        self?.listRows.append(detailViewModel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
