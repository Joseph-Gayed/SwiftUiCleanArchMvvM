//
//  UseCase.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 31/03/2023.
//

import Foundation
//Generic UseCase to be parent of all usecases
protocol UseCase {
    associatedtype ResponseType
    func execute(completion: @escaping (Result<ResponseType, Error>) -> Void)
}
