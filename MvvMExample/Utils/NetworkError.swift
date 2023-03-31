//
//  NetworkError.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation

enum NetworkError:Error{
    case badUrl
    case badRequest
    case decodingException
}
