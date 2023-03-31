//
//  ProductsLocalDataSourceImp.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation

class ProductsLocalDataSourceImp : ProductsLocalDataSource{
    let productsUserDefaultsKey:String = "productsUserDefaultsKey"

    //save products in user defaults
    func saveProducts(products: [Product]) {
        print("Local: SaveProducts")

        if let encodedProducts = try? JSONEncoder().encode(products){
            UserDefaults.standard.set(encodedProducts, forKey: productsUserDefaultsKey)
            print("Local: SaveProducts Done")
        }
    }
    
    //load products from user defaults
    func getProducts() async throws -> [Product] {
        print("Local: getProducts")

        if let prouctsJson = UserDefaults.standard.data(forKey: productsUserDefaultsKey) {
            if let decodedProducts = try? JSONDecoder().decode([Product].self, from: prouctsJson) {
                return decodedProducts
            }
            else {return []}
        }
        else {return []}
    }
    
    
}
