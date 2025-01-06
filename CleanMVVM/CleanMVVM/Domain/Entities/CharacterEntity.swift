//
//  CharacterEntity.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 28/12/24.
//

/// A domain layer entity representing a character.
/// This struct serves as the primary data model in the domain layer.
struct CharacterEntity: Identifiable {
    
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
}

