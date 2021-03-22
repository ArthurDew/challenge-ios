//
//  challenge_iosTests.swift
//  challenge-iosTests
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import XCTest
@testable import challenge_ios

class challenge_iosTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestGetResources() throws {
        let viewModel = BanksViewModel()
        
        if viewModel.resources.count != 0 {
            XCTAssert(false)
        }
        
        viewModel.getBanks {
            if viewModel.resources.count > 0 {
                XCTAssert (true)
            }
        }
    }
    
    func testOrderResources() throws {
        let country = String((NSLocale.preferredLanguages[0]).prefix(2))
        let viewModel = BanksViewModel()
        
        viewModel.getBanks {
            viewModel.orderBanks {
                if viewModel.resources[0].parent_banks[0].banks[0].country_code.caseInsensitiveCompare(country) == ComparisonResult.orderedSame {
                    XCTAssert (true)
                } else {
                    XCTAssert (false)
                }
            }
        }
    }

}
