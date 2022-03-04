//
//  TransactionViewModelUnitTest.swift
//  TechChallengeTests
//
//  Created by Princess  on 04/03/2022.
//

import XCTest
@testable import TechChallenge

class TransactionViewModelUnitTest: XCTestCase {
    var viewModel: TransactionViewModel!
    
    override func setUpWithError() throws {
        viewModel = TransactionViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFilterByCategoryIsNotEmpty() throws {
        viewModel.singleCategory = []
        viewModel.getEachCategory(eachCategory: "entertainment")
        XCTAssert(!viewModel.singleCategory.isEmpty)
    }
    
    func testFilterByCategoryIsEmpty() throws {
        viewModel.singleCategory = []
        viewModel.getEachCategory(eachCategory: "Swift")
        XCTAssert(viewModel.singleCategory.isEmpty)
    }

    func testSumOfTransactionAmountForFilteredCategory() throws {
        viewModel.total = 0
        viewModel.calculateTotalAmount(eachCategory: "travel")
        XCTAssert(viewModel.total != 0.0)
        
    }
    
    func testSumOfTransactionAmountForFood() throws {
        let total = viewModel.calculateTotalPriceForInsight(eachCategory: .food)
        XCTAssert(total == 74.28)
        
    }
    
    
    func testSumOfTransactionAmountForHealth() throws {
        let total = viewModel.calculateTotalPriceForInsight(eachCategory: .health)
        XCTAssert(total == 21.53)
        
    }
    
    
    func testSumOfTransactionAmountForEntertainment() throws {
        let total = viewModel.calculateTotalPriceForInsight(eachCategory: .entertainment)
        XCTAssert(total == 82.99)
        
    }
    
    
    func testSumOfTransactionAmountForShopping() throws {
        let total = viewModel.calculateTotalPriceForInsight(eachCategory: .shopping)
        XCTAssert(total == 78)
        
    }
    
    
    func testSumOfTransactionAmountForTravel() throws {
        let total = viewModel.calculateTotalPriceForInsight(eachCategory: .travel)
        XCTAssert(total == 215.28)
        
    }

}
