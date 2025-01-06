//
//  CharacterRepositoryTests.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import XCTest
import Combine
@testable import CleanMVVM

class CharacterRepositoryTests: XCTestCase {
    var repository: CharacterRepository!
    var mockDataSource: MockCharacterRemoteDataSource!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockDataSource = MockCharacterRemoteDataSource()
        repository = CharacterRepository(remoteDataSource: mockDataSource)
        cancellables = []
    }

    func testGetCharactersSuccess() {
        let expectation = XCTestExpectation(description: "Fetch characters from repository")

        repository.getCharacters(page: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success but got failure")
                }
            }, receiveValue: { characters in
                XCTAssertEqual(characters.count, 2)
                XCTAssertEqual(characters.first?.name, "Rick Sanchez")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

class MockCharacterRemoteDataSource: CharacterRemoteDataSourceProtocol {
    func fetchCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        let sampleCharacters = [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male"),
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male")
        ]
        return Just(sampleCharacters)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}


