//
//  Product.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation

struct Product: Identifiable , Codable{
    let id :Int
    let title:String
    let description:String
    let thumbnail:String
    let price:Double
}
