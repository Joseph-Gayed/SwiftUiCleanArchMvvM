//
//  ProductsLocalDataSource.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation
protocol ProductsLocalDataSource : ProductsDataSource{
    func saveProducts(products:[Product])
}
