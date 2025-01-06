//
//  ImageView.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI

/// This view uses the `AsyncImage` component to load and display an image
struct ImageView: View {
    /// The URL string of the image.
    let urlString: String
   
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .empty:
                Image(Constants.placeholderImage).resizable().aspectRatio(contentMode: .fit)
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo").resizable().aspectRatio(contentMode: .fit)
            @unknown default:
                // Fallback for unexpected states.
                EmptyView()
            }
        }
            .frame(width: Constants.Numbers.imageSize, height: Constants.Numbers.imageSize) // Sets the dimensions of the image.
            .cornerRadius(Constants.Numbers.imageRadius) // Set the cornerRadius of the image.
    }
}

#Preview {
    ImageView(urlString: "https://rickandmortyapi.com/api/character/avatar/21.jpeg")
}
