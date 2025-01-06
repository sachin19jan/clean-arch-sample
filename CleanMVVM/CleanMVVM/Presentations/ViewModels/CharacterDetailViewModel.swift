//
//  CharacterDetailViewModel.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI
/// A ViewModel that manages the details of a `Character` for the UI.
final class CharacterDetailViewModel: CharactersDetailVMProtocol {
    /// The character whose details are being managed.
    @Published var character: CharacterModel
    
    /// Initializes a `CharacterDetailViewModel` with a given `Character`.
    /// - Parameter character: The `CharacterModel` instance whose details will be managed by the ViewModel.
    init(character: CharacterModel) {
        self.character = character
    }
}

