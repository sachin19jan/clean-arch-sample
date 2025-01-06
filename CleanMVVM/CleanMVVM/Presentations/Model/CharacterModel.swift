//
//  CharacterViewModel.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 28/12/24.
//


/// A model representing a character, conforming to `Identifiable` and `Equatable`.
/// This struct is used to map data between the domain layer and the presentation layer.
struct CharacterModel: Identifiable, Equatable {
    
    /// The unique identifier of the character.
    let id: Int
    
    /// The name of the character.
    let name: String
    
    /// The status of the character (e.g., "Alive", "Dead", "Unknown").
    let status: String
    
    /// The species of the character (e.g., "Human", "Alien").
    let species: String
    
    /// The URL of the character's image.
    let image: String
    
    /// The gender of the character (e.g., "Male", "Female", "Genderless", "Unknown").
    let gender: String

    /// Initializes a `CharacterModel` instance from a `CharacterEntity` object.
    /// - Parameter entity: The `CharacterEntity` object containing character data from the domain layer.
    init(from entity: CharacterEntity) {
        self.id = entity.id
        self.name = entity.name
        self.status = entity.status
        self.species = entity.species
        self.image = entity.image
        self.gender = entity.gender
    }
}

