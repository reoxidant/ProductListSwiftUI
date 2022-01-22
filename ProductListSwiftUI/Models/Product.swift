//
//  Product.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 01.01.2022.
//

import Foundation

struct Product: Decodable {
    let title: String
    let image: URL
    let description: String
    let category: String
    let price: Double
    
    static func getProduct() -> Product {
        Product(title: "Detroit: Become Human: Три основные концовки (лучшая, худшая, секретная)",
                image: URL(string: "https://images.stopgame.ru/games/logos/15459/c413x234/mP_oHEax1hVxI__QmBKeOQ/detroit_become_human.jpg")!,
                description: "К октябрю 2019-го тираж Detroit: Become Human превысил 3.2 миллиона копий. Таким образом, в период с декабря 2018 года по октябрь 2019-го игру купили более миллиона раз.",
                category: "Игры для PS4",
                price: 1000)
    }
}
