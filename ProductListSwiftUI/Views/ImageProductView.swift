//
//  ImageProductView.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import SwiftUI

struct ImageProductView: View {
    
    @State private var image: Image?
    let imageData: Data?
    let imageSize: CGSize
    let radius: CGFloat
    
    var body: some View {
        VStack {
            if image != nil {
                image?
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(radius)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize.width, height: imageSize.height)
                    .cornerRadius(radius)
            }
        }.onAppear {
            loadImage(data: imageData)
        }
    }
    
    private func loadImage(data: Data?){
        DispatchQueue.global().async {
            guard let data = data else { return }
            if let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct ImageProductView_Previews: PreviewProvider {
    static var previews: some View {
        ImageProductView(imageData: nil, imageSize: CGSize(width: 200, height: 200), radius: 20)
    }
}
