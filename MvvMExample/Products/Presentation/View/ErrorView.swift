//
//  ErrorView.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 23/03/2023.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let retryAction : (()-> Void )?
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text(errorMessage)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
            if let retryAction = retryAction {
                Button(action: retryAction) {
                    Text("Retry")
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "Something Went Wrong",retryAction: nil)
    }
}
