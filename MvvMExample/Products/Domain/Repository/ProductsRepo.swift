//
//  ProductsRepo.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation

protocol ProductsRepo{
    func getProducts() async throws->[Product]
}
