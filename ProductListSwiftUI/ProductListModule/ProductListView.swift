//
//  ContentView.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 01.01.2022.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.listRows, id: \.title) { detailProductView in
                NavigationLink(destination: DetailProductView(viewModel: detailProductView)) {
                    ProductRowView(viewModel: detailProductView)
                }
            }
            .navigationBarTitle("Product List")
        }
        .onAppear {
            viewModel.fetchListRows()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
