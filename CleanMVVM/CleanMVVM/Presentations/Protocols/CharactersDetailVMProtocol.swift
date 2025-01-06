//
//  CharactersDetailVMProtocol.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 04/01/25.
//

import Foundation

protocol CharactersDetailVMProtocol: ObservableObject {
    
    var character: CharacterModel { get }
    
}
