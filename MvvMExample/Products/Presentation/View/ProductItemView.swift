//
//  ProductItemView.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import SwiftUI
import Kingfisher

struct ProductItemView: View {
    let uiProduct:UiProduct
    
    
    var body: some View {
        productItemView()
            .frame(maxWidth: .infinity,alignment: .topLeading)
    }
    
    func productItemView()-> some View{
        return HStack{
            KFImage(URL(string: uiProduct.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFill()
                .frame(width: 100,height: 100)
                .clipped()
                .frame(alignment: .topLeading)
                .cornerRadius(8)
            productTextContent()
                .padding(.horizontal)
                

            priceView()
        }
    }
    
    func productTextContent()->some View{
        return VStack{
            Text(uiProduct.title)
                .font(.body)
                .foregroundColor(.black.opacity(0.5))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .multilineTextAlignment(.leading)
            
            
            Text(uiProduct.description)
                .font(.caption)
                .foregroundColor(.black.opacity(0.5))
                .frame(maxWidth: .infinity,alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            
        }
    }
    
    func priceView()-> some View {
        return   Text("\(uiProduct.price.formatted(toPlaces: 0)) $")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.red.opacity(0.8))
            .multilineTextAlignment(.leading)
    }
}

struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        let prod = Product(
            id: 1,
            title: "iPhone 9",
            description: "An apple mobile which is nothing like apple",
            thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
            price: 549)
        ProductItemView(uiProduct: UiProduct(product: prod))
    }
}
