//
//  CharactersVMProtocol.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 03/01/25.
//

import Foundation

protocol CharactersVMProtocol: ObservableObject {
    
    var characters: [CharacterModel] { get }
    
    /// A published Boolean value indicating whether character data is currently being loaded.
    var isLoading: Bool { get }
    
    /// A published optional string that holds an error message if loading characters fails.
    var errorMessage: String? { get }
    
    /// A published Boolean value indicating whether there is more data to load for pagination.
    var hasMoreData: Bool { get }
    
    /// A variable that tracks the current page for pagination.
    var currentPage: Int { get }
    
    /// A protocol-conforming object responsible for fetching character data.
    var fetchCharactersUseCase: FetchCharactersUseCaseProtocol { get }
    
    func loadMoreCharacters()
}
