//
//  ProductsRepoImpl.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation

class ProductsRepoImp : ProductsRepo{
    
    let remoteDataSource: ProductsDataSource
    let localDataSource: ProductsLocalDataSource

    init(remoteDataSource: ProductsDataSource,localDataSource: ProductsLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    //if no cached Local data  , try to get remote , then cache the new data
    func getProducts() async throws -> [Product] {
        print("----------------getProducts---------------------")

        let cachedProducts = try await localDataSource.getProducts()
        print("cached products size = \(cachedProducts.count)")

        if cachedProducts.isEmpty{
            let products = try await remoteDataSource.getProducts()
            if !products.isEmpty{
                localDataSource.saveProducts(products: products)
                print("remote products size = \(products.count)")
                return products
            }
            else { return [] }
        }
        else{ return cachedProducts }
        
    }
    
}
