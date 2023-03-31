//
//  ProductsRemoteDataSourceImp.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation
class ProductsRemoteDataSourceImp : ProductsDataSource{
    let apiUrl = EndPoints.PRODUCTS
    func getProducts() async throws -> [Product] {
        print("Remote: getProducts")

        //Step1: try to get the URL object, if failed throw bad url error
        //Step2: await to get (data,response) using URLSession
        //Step3: try to cast response to httpResposne, if failed throw bad request error
        //Step4: try to decode the httpResponse to ProductsReponse , if failed throw DecodingError
        //Step5: return list of products
        
        //Step1
        guard let url = URL(string: apiUrl) else { throw NetworkError.badUrl}
        
        //Step2
        let (data,response) = try await URLSession.shared.data(from: url)
        
        //Step3
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200
        else {throw  NetworkError.badRequest}
        
        //Step4
        guard let productResponse = try? JSONDecoder().decode(ProductsResponse.self, from: data)
        else {throw NetworkError.decodingException}
        
        //Step5
        return productResponse.products
    }
    
    
}
