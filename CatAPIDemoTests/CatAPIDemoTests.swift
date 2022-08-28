//
//  CatAPIDemoTests.swift
//  CatAPIDemoTests
//
//  Created by G Zhen on 8/26/22.
//

import XCTest
import Combine
@testable import CatAPIDemo

class CatAPIDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscriptions = []
    }

    var subscriptions = Set<AnyCancellable>()
    
    func testFetchBreedsSuccess() {
        let result = Result<[Breed], APIError>.success(Breed.getBreeds())
        let catBreedMock = CatBreed(apiService: APIMockService(result: result))
        
        let promise = expectation(description: "fetch all breeds successfully")
        
        catBreedMock.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }
        .store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    func testFetchBreedsFailure() {
        let result = Result<[Breed], APIError>.failure(APIError.unknown)
        let catBreedMock = CatBreed(apiService: APIMockService(result: result))
        
        let promise = expectation(description: "failed to fetch all breeds")
        
        catBreedMock.$breeds.sink { breeds in
            if !breeds.isEmpty {
                XCTFail()
            }
        }
        .store(in: &subscriptions)
        
        catBreedMock.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }
        .store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }

}
