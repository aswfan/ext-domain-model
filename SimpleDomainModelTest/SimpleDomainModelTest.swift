//
//  SimpleDomainModelTest.swift
//  SimpleDomainModelTest
//
//  Created by iGuest on 4/12/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import XCTest

import ExtDomainModel

//////////////////
// Basic "test that the tests are working" tests
//
class SimpleDomainModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(testMe() == "I have been tested")
    }
    
    func testClassExample() {
        let test = TestMe()
        XCTAssert(test.Please() == "I have been tested")
    }
    
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measureBlock {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}

