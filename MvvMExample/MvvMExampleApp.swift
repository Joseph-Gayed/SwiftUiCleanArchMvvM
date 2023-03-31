//
//  MvvMExampleApp.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import SwiftUI

@main
struct MvvMExampleApp: App {
    
    @StateObject private var productsViewModel =  DependanciesManger().provideProductsViewMode()

    
    var body: some Scene {
        WindowGroup {
            ProductsScreen()
                .environmentObject(productsViewModel)
        }
    }
}


class DependanciesManger {
    @MainActor
    func provideProductsViewMode()->ProductsViewModel {
        return ProductsViewModel(getProductsUseCase: provideGetProductsUseCase())
    }
    
    
    func provideGetProductsUseCase()->GetProductsUseCase{
        return GetProductsUseCase(productsRepo: provideRepo())
    }
    
    func provideRepo()-> ProductsRepo {
        return ProductsRepoImp(remoteDataSource: provideRemoteDataSource(), localDataSource: provideLocalDataSource())
    }
    
    func provideRemoteDataSource()->ProductsDataSource {
        return ProductsRemoteDataSourceImp()
    }
    
    func provideLocalDataSource()->ProductsLocalDataSource{
        return ProductsLocalDataSourceImp()
    }
}
