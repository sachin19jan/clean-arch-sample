//
//  CharacterDetailView.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI

/// This view displays the detailed information of a character, using a `CharacterDetailViewModel` for data management.
struct CharacterDetailView<T: CharactersDetailVMProtocol>: View {
    
    @ObservedObject var viewModel: T
    
    var body: some View {
        VStack(spacing: Constants.Spacing.small) {
            // Asynchronously loads and displays the character's image.
            AsyncImage(url: URL(string: viewModel.character.image)) { phase in
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
            .frame(width: Constants.Padding.largePadding, height: Constants.Padding.largePadding)
            .clipShape(Circle())
            
            Text(viewModel.character.name)
                .font(.largeTitle)
                .bold()
                .accessibilityIdentifier(Constants.Identifier.characterNameLabel)
            Text(viewModel.character.species)
                .font(.title2)
            Text(viewModel.character.status)
                .foregroundColor(viewModel.character.status == Constants.Screen.characterStatus ? .green : .red)
                .font(.headline)
            Text(viewModel.character.gender)
                .foregroundColor(viewModel.character.gender == Constants.Screen.characterGender ? .blue : .pink)
                .font(.subheadline)
        }
        .padding()
        .navigationTitle(viewModel.character.name) // Sets the navigation title to the character's name.
    }
}


// MARK: - Preview
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
       let entity = CharacterEntity(id: 1,
                        name: "Sachin Bhardwaj",
                        status: "Alive",
                        species: "Human",
                        image: "",
                        gender: "Male")
        let sampleCharacter = CharacterModel(
            from: entity)
        CharacterDetailView(viewModel: CharacterDetailViewModel(character: sampleCharacter))
    }
}
