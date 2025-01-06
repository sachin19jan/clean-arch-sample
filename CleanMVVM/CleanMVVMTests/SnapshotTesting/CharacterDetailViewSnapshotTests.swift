//
//  CharacterDetailViewSnapshotTests.swift
//  CleanMVVM
//
//  Created by Sachin Bhardwaj on 02/01/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import CleanMVVM

class CharacterDetailViewSnapshotTests: XCTestCase {

    func testCharacterDetailViewSnapshot() {
        // Create CharacterDetailView using mock data
        
        let view = CharacterDetailView(viewModel: CharacterDetailViewModel(character: MockData.sampleCharacter))
        
        // Use withSnapshotTesting for snapshot comparison
        withSnapshotTesting {
            assertSnapshot(
                of: view,
                as: .image(layout: .device(config: .iPhone12))
            )
        }
    }
}
