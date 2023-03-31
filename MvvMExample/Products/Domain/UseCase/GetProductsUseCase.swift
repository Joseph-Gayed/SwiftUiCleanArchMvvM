//
//  GetProductsUseCase.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation
class GetProductsUseCase : UseCase{
    
    let productsRepo:ProductsRepo
    init(productsRepo: ProductsRepo) {
        self.productsRepo = productsRepo
    }
    
    typealias ResponseType = [Product]
    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
        Task.init {
            do {
                let products = try await productsRepo.getProducts()
                completion(.success(products))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
