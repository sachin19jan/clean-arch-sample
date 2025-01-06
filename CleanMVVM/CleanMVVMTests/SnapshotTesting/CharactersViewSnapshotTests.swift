//
//  CharactersViewSnapshotTests.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 02/01/25.
//


import XCTest
import SwiftUI
import SnapshotTesting
@testable import CleanMVVM

class CharactersViewSnapshotTests: XCTestCase {

    func testCharactersViewSnapshot() {
        // Create the CharactersView with mock data
        
        let viewModel = CharactersViewModel()
        viewModel.characters = MockData.characters
        let view = CharactersView(viewModel: viewModel)
        
        // Use withSnapshotTesting for snapshot comparison
        withSnapshotTesting {
            assertSnapshot(
                of: view,
                as: .image(layout: .device(config: .iPhone12))
            )
        }
    }

    func testCharactersViewEmptyStateSnapshot() {
        // Create CharactersView with no data
        let viewModel = CharactersViewModel()
        viewModel.characters = []
        let view = CharacterListView(viewModel: viewModel)
        
        // Use withSnapshotTesting for snapshot comparison
        withSnapshotTesting {
            assertSnapshot(
                of: view,
                as: .image(layout: .device(config: .iPhone12))
            )
        }
    }
}
