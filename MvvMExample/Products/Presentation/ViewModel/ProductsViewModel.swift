//
//  ProductsViewModel.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import Foundation

@MainActor
class ProductsViewModel: ObservableObject {
    
    @Published
    var isLoadingState:Bool = true
    
    @Published
    var isRefreshingState:Bool = false
    
    @Published
    var isEmptyState:Bool = false
    
    @Published
    var error:Error? = nil
    
    @Published
    var uiProducts:[UiProduct] = []
    
    
    
    private let getProductsUseCase: GetProductsUseCase
    init(getProductsUseCase: GetProductsUseCase){
        self.getProductsUseCase = getProductsUseCase
    }
    
    func propagateProducts(isRefreshing:Bool = false) {
        resetStates(isRefeshing: isRefreshing)
        showLoading(isRefeshing: isRefreshing)
        
        //simulate network latency 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.getProducts(isRefreshing: isRefreshing)
        }
    }
    
    
    func getProducts(isRefreshing:Bool){
        self.getProductsUseCase.execute { result in
            switch result {
            case .success(let products):
                // Handle the list of products
                DispatchQueue.main.async {
                    self.handleSuccess(isRefreshing:isRefreshing , products:products)
                }
                
            case .failure(let error):
                // Handle the error
                DispatchQueue.main.async {
                    self.handleError(isRefreshing:isRefreshing , error: error)
                }
            }
        }
    }
    
    fileprivate func resetStates(isRefeshing:Bool){
        isLoadingState = true
        isRefreshingState = false
        isEmptyState = false
        error = nil
        if(!isRefeshing){
            uiProducts = []
        }
    }
    
    func showLoading(isRefeshing:Bool)  {
        var taskType = ""
        if (isRefeshing) {taskType = "Refreshing"} else {taskType = "Loading"}
        print("-------------------------------------")
        print("\(taskType) Started.....")
        if(isRefeshing) {
            self.isRefreshingState = true
        } else{
            self.isLoadingState = true
        }
    }
    
    
    func handleSuccess(isRefreshing: Bool , products:[Product]){
        self.updateState(isRefreshing: isRefreshing  , products: products)
    }
    
    func handleError(isRefreshing: Bool , error:Error){
        //simulate network latency 3 seconds
        self.hideLoading(isRefeshing: isRefreshing)
        self.error = error
        print("-------------------------------------")
        print("Error: \(error)")
    }
    
    
    func hideLoading(isRefeshing:Bool)  {
        print("-------------------------------------")
        print("Ended.....")
        if(isRefeshing) {
            self.isRefreshingState = false
        } else{
            self.isLoadingState = false
        }
    }
    
    
    fileprivate func updateState(isRefreshing:Bool , products:[Product]) {
        self.hideLoading(isRefeshing: isRefreshing)
        self.uiProducts = products.map(UiProduct.init)
        self.isEmptyState = self.uiProducts.isEmpty
        
        print("products count = \(products.count)")
    }
    
    
}



