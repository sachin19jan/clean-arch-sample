//
//  CharacterMapper.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 28/12/24.
//

// Domain Layer: CharacterMapper.swift
struct CharacterMapper {
    static func map(dataModel: Character) -> CharacterEntity {
        return CharacterEntity(
            id: dataModel.id,
            name: dataModel.name,
            status: dataModel.status,
            species: dataModel.species,
            image: dataModel.image,
            gender: dataModel.gender
        )
    }
    
    static func map(dataModels: [Character]) -> [CharacterEntity] {
        return dataModels.map { map(dataModel: $0) }
    }
}

