//
//  FetchCharactersUseCaseTests.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import XCTest
import Combine
@testable import CleanMVVM

class FetchCharactersUseCaseTests: XCTestCase {
    var useCase: FetchCharactersUseCase!
    var mockRepository: MockCharacterRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockCharacterRepository()
        useCase = FetchCharactersUseCase(repository: mockRepository)
        cancellables = []
    }

    func testExecuteSuccess() {
        let expectation = XCTestExpectation(description: "Execute fetch characters use case")

        useCase.execute(page: 1)
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

class MockCharacterRepository: CharacterRepositoryProtocol {
    
    func getCharacters(page: Int) -> AnyPublisher<[CharacterEntity], Error> {
        let sampleCharacters = [
            CharacterEntity(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male"),
            CharacterEntity(id: 2, name: "Morty Smith", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male")
        ]
        return Just(sampleCharacters)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}


