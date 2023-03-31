//
//  ProductsRemoteDataSource.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation
protocol ProductsDataSource{
    func getProducts() async throws->[Product]
}
