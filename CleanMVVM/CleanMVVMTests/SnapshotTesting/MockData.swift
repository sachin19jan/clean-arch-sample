//
//  MockData.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 02/01/25.
//

@testable import CleanMVVM
struct MockData {
    static let characters = [
        CharacterModel(from: CharacterEntity(id: 1,
                                             name: "Rick Sanchez",
                                             status: "Alive",
                                             species: "Human",
                                             image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                                             gender: "Male")),
        CharacterModel(
            from: CharacterEntity(id: 2,
                                  name: "Morty Smith",
                                  status: "Alive",
                                  species: "Human",
                                  image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                                  gender: "Male"))
    ]
    
    static let sampleCharacter = CharacterModel(
        from: CharacterEntity(id: 1,
                              name: "Rick Sanchez",
                              status: "Alive",
                              species: "Human",
                              image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                              gender: "Male")
    )
}
