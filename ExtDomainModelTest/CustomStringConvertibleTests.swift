//
//  CustomStringConvertibleTests.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/12/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import XCTest

class CustomStringConvertibleTests: XCTestCase {
    
    func testMoneyConvertible(){
        let money = Money(amount: 10, currency: "USD")
        XCTAssert(money.description == "USD10")
    }
    
    func testJobConvertible() {
        let job = Job(title: "Guest Lecturer", type: Job.JobType.Salary(1000))
        XCTAssert(job.description == "Job: Guest Lecturer, Salary: 1000 per year")
    }
    
    func testPersonConvertible() {
        let person = Person(firstName: "Ted", lastName: "Neward", age: 45)
        XCTAssert(person.description == "[Person: firstName:Ted lastName:Neward age:45 job:nil spouse:nil]")
    }
    
    func testFamilyConvertible() {
        let ted = Person(firstName: "Ted", lastName: "Neward", age: 45)
        ted.job = Job(title: "Gues Lecturer", type: Job.JobType.Salary(1000))
        
        let charlotte = Person(firstName: "Charlotte", lastName: "Neward", age: 45)
        
        let family = Family(spouse1: ted, spouse2: charlotte)
        
        let mike = Person(firstName: "Mike", lastName: "Neward", age: 22)
        mike.job = Job(title: "Burger-Flipper", type: Job.JobType.Hourly(5.5))
        
        let matt = Person(firstName: "Matt", lastName: "Neward", age: 16)
        let _ = family.haveChild(mike)
        let _ = family.haveChild(matt)
        print(family.description)
        XCTAssert(family.description == "Members: Ted Neward, Charlotte Neward, Mike Neward, Matt Neward, Household Income: 12000")
    }


}
