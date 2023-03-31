//
//  ProductsScreen.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 22/03/2023.
//

import SwiftUI

struct ProductsScreen: View {
    @EnvironmentObject
    private var viewModel:ProductsViewModel
    
    var body: some View {
        NavigationView(){
            ZStack{
                stateView()
            }
            .navigationTitle("Products")
            
//            .refreshable(action: {
//                viewModel.propagateProducts(isRefreshing: true)
//            }, refreshing: viewModel.isRefreshingState)
        }
        .onAppear {
            viewModel.propagateProducts()
        }
    }
    
    func printStates(){
        print("-------------------------------------")
        print("isLoading = \(viewModel.isLoadingState)")
        print("isRefreshing = \(viewModel.isRefreshingState)")
        print("isEmpty = \(viewModel.isEmptyState)")
        print("products = \(viewModel.uiProducts.count)")
        print("isError = \(String(describing: viewModel.error))")
    }
    
    
    func stateView() -> some View {
        printStates()
        if viewModel.isLoadingState {
            return AnyView(ProgressView())
        } else if let error = viewModel.error {
            return AnyView(ErrorView(errorMessage: error.localizedDescription, retryAction: {
                viewModel.propagateProducts()
            }))
        } else if !viewModel.uiProducts.isEmpty {
            return AnyView(productsView())
        } else {
            return AnyView(EmptyView())
        }
    }
    
    
    
    func productsView() -> some View{
        List(viewModel.uiProducts){ uiProduct in
            ProductItemView(uiProduct: uiProduct)
        }
    }
    
}

struct ProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductsScreen()
    }
}
