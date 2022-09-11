//
//  NewsListViewModel_Test.swift
//  NewsAppTests
//
//  Created by MacBook on 11/09/2022.
//

import XCTest
@testable import NewsApp
import Combine

class NewsListViewModel_Test: XCTestCase {
    var viewModel: NewsListViewModel?
    var cancellable = Set<AnyCancellable>()
    
    override func setUp() {
        viewModel = NewsListViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }

    func test_newsAttribute_shouldBeEmpty() {
        XCTAssertTrue(viewModel!.news.isEmpty)
    }
    
    func test_apiKey_shouldNotBeEmpty() {
        XCTAssertFalse(viewModel!.apiKey.isEmpty)
    }
    
    func test_buildGetEverythingUrl_shouldNotBeNil() {
        let builtUrl = viewModel!.buildGetEverythingUrl()
        
        XCTAssertNotNil(builtUrl)
    }
    
    func test_retrieveAllNews_newsShouldReturnNews() {
        let expectation = XCTestExpectation(description: "Should retrieve news from api")
        
        viewModel!.$news
            .dropFirst()
            .sink { news in
                expectation.fulfill()
            }
            .store(in: &cancellable)
        
        viewModel!.retrieveAllNews()
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertGreaterThan(viewModel!.news.count, 0)
    }

}
