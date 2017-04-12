//
//  DoubleExtensionTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/12/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import XCTest

import ExtDomainModel

class DoubleExtensionTests: XCTestCase {

    func testConvertDoubleToMoney() {
        let double = 2.2
        let money = double.USD
        XCTAssert(money.currency == "USD")
        XCTAssert(money.amount == 2)
    }
    
    
}
