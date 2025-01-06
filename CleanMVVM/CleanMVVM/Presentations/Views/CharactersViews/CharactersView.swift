//
//  CharactersView.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI

/// CharactersView displays a list of characters with pagination, error handling, and navigation to character details.
struct CharactersView<T: CharactersVMProtocol>: View {
    @StateObject var viewModel: T

    var body: some View {
        NavigationView {
            if viewModel.isLoading && viewModel.characters.isEmpty {
                LoadingView()
            } else if let errorMessage = viewModel.errorMessage {
                ErrorView(errorMessage: errorMessage)
            } else {
                CharacterListView(viewModel: viewModel)
                    .navigationTitle(Constants.Screen.defaultNavigationTitle)
                    .onAppear {
                        if viewModel.characters.isEmpty {
                            viewModel.loadMoreCharacters()
                        }
                    }.listStyle(PlainListStyle())
            }
        }
    }
}

/// This view shows a `ProgressView` to indicate that characters are being loaded.
struct LoadingView: View {
    var body: some View {
        ProgressView()
    }
}

// This view shows an error message when there is an issue during the data fetch.
struct ErrorView: View {
    let errorMessage: String

    var body: some View {
        Text("Error: \(errorMessage)")
            .foregroundColor(.red)
    }
}

/// This view displays a list of fetched characters and handles pagination and loading more characters.
struct CharacterListView<T: CharactersVMProtocol>: View {
    @ObservedObject var viewModel: T

    var body: some View {
        if viewModel.characters.isEmpty {
            ErrorView(errorMessage: Constants.nodata)
        } else {
            List {
                ForEach(viewModel.characters) { character in
                    CharacterRowView(character: character)
                        .onAppear {
                            if character == viewModel.characters.last {
                                viewModel.loadMoreCharacters()
                            }
                        }
                }
                
                if viewModel.isLoading {
                    LoadingIndicatorView()
                }
            }
            .accessibilityIdentifier(Constants.Identifier.charactersList)
        }
    }
}

/// This view displays each individual character row with a navigation link to their detailed view.
struct CharacterRowView: View {
    let character: CharacterModel

    var body: some View {
        NavigationLink(
            destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character)),
            label: {
                CharacterRow(character: character)
            }
        )
    }
}

// Show loading indicator if characters are being loaded and no characters have been fetched yet.
struct LoadingIndicatorView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView("Loading more...")
            Spacer()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacters = [
            CharacterModel(from: CharacterEntity(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male")),
            CharacterModel(from: CharacterEntity(id: 2, name: "Morty Smith", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male"))
        ]

        let viewModel = CharactersViewModel()
        viewModel.characters = sampleCharacters

        return CharactersView(viewModel: CharactersViewModel())
            .environmentObject(viewModel)
    }
}
