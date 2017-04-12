//
//  MathematicsProtocolTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/12/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import XCTest

class MathematicsProtocolTests: XCTestCase {

    let tenUSD = Money(amount: 10, currency: "USD")
    let sixGBP = Money(amount: 6, currency: "GBP")
    let twentyCAN = Money(amount: 20, currency: "CAN")
    
    func testMoneyAddition() {
        let money = tenUSD.add(sixGBP)
        XCTAssert(money.currency == "GBP")
        XCTAssert(money.amount == 11)
    }
    
    func testMoneySubtraction() {
        let money = twentyCAN.subtract(tenUSD)
        XCTAssert(money.currency == "USD")
        XCTAssert(money.amount == 6)
    }

}
