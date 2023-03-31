//
//  EmptyView.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 23/03/2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "doc.text.magnifyingglass")
                .resizable()
                .font(.largeTitle)
                .foregroundColor(.red)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity,alignment: .center)
                
            Text("Nothing Found")
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .padding()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
