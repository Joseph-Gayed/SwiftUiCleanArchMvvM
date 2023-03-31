//
//  UiProduct.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation

struct UiProduct:Identifiable {
    private var product:Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id:Int{
        self.product.id
    }
    
    var title:String{
        self.product.title
    }
    
    var description:String{
        self.product.description
    }
    
    var thumbnail:String{
        self.product.thumbnail
    }
    
    var price:Double{
        self.product.price
    }
}
