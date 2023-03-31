//
//  ProductsResponse.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation

struct ProductsResponse:Decodable{
    let limit:Int
    let products:[Product]
    let total:Int
}
