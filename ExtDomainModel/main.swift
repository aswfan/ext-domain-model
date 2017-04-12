//
//  main.swift
//  ExtDomainModel
//
//  Created by iGuest on 4/9/17.
//  Copyright © 2017 yyfan. All rights reserved.
//

import Foundation

print("Hello, World!")


protocol CustomStringConvertible {
    
    var description: String { get }
    
}

protocol Mathematics {
    func add(_ to: Money) -> Money
    
    func subtract(_ from: Money) -> Money
}


extension Double {
    var USD: Money {
        get {
            return Money(amount: Int(self), currency: "USD")
        }
    }
    
    var EUR: Money {
        get {
            return Money(amount: Int(self), currency: "EUR")
        }
    }
    
    var GBP: Money {
        get {
            return Money(amount: Int(self), currency: "GBP")
        }
    }
    
    var CAN: Money {
        get {
            return Money(amount: Int(self), currency: "CAN")
        }
    }
    
}




public func testMe() -> String {
    return "I have been tested"
}

open class TestMe {
    open func Please() -> String {
        return "I have been tested"
    }
}

////////////////////////////////////
// Money
//
public struct Money: CustomStringConvertible, Mathematics {
    
    var description: String {
        get {
            return "\(currency)\(amount)"
        }
    }

    //  Extra Credits
    enum cType: String {
        case USD = "USD"
        case GBP = "GBP"
        case EUR = "EUR"
        case CAN = "CAN"
        case Nil = "Nil"
    }
    
    var amount: Int
    var type: cType = cType.Nil
    var currency: String {
        get {
            return type.rawValue
        }
        set(value) {
            switch value {
            case cType.USD.rawValue:
                self.type = cType.USD
            case cType.GBP.rawValue:
                self.type = cType.GBP
            case cType.EUR.rawValue:
                self.type = cType.EUR
            case cType.CAN.rawValue:
                self.type = cType.CAN
            default:
                self.type = cType.Nil
                print("Illegal Input: please enter correct currency cType!")
            }
            
        }
    }
    
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    init(amount: Int, currency: cType) {
        self.init(amount: amount, currency: currency.rawValue)
    }
    
    func convert(_ newC: String) -> Money {
        var nCur: cType = cType.Nil
        var nAmount = 0
        switch newC {
        case cType.USD.rawValue:
            nCur = cType.USD
        case cType.GBP.rawValue:
            nCur = cType.GBP
        case cType.EUR.rawValue:
            nCur = cType.EUR
        case cType.CAN.rawValue:
            nCur = cType.CAN
        default:
            print("Illegal Input: please enter correct currency Type!")
        }
        
        if nCur != cType.Nil {
            nAmount = compute(Cur: self.type, nCur: nCur)
        }
        return Money(amount: nAmount, currency: nCur)
    }
    
    func convert(_ newC: cType) -> Money {
        return self.convert(newC.rawValue)
    }
    
    func compute(Cur: cType, nCur: cType) -> Int! {
        var value: Int? = nil
        switch (Cur, nCur) {
        case (cType.USD, cType.GBP):
            value = amount / 2
        case (cType.GBP, cType.USD):
            value = amount * 2
        case (cType.USD, cType.EUR):
            value = amount / 2 * 3
        case (cType.EUR, cType.USD):
            value = amount / 3 * 2
        case (cType.USD, cType.CAN):
            value = amount / 4 * 5
        case (cType.CAN, cType.USD):
            value = amount / 5 * 4
        case (cType.GBP, cType.EUR):
            value = amount * 3
        case (cType.EUR, cType.GBP):
            value = amount / 3
        case (cType.GBP, cType.CAN):
            value = amount / 2 * 5
        case (cType.CAN, cType.GBP):
            value = amount / 5 * 2
        case (cType.EUR, cType.CAN):
            value = amount / 6 * 5
        case (cType.CAN, cType.EUR):
            value = amount / 5 * 6
        default:
            print("Illegal Currency Coverting!")
        }
        return value
    }
    
    public func add(_ to: Money) -> Money {
        var nMon = self
        if nMon.currency != to.currency {
            nMon = nMon.convert(to.currency)
        }
        nMon.amount += to.amount
        return nMon
        
    }
    
    
    public func subtract(_ from: Money) -> Money {
        var nMon = self
        if nMon.currency != from.currency {
            nMon = nMon.convert(from.currency)
        }
        nMon.amount -= from.amount
        return nMon
    }
    
}

////////////////////////////////////
// Job
//
open class Job:  CustomStringConvertible{
    
    var description: String {
        get {
            var str = ""
            switch type {
            case let .Hourly(value):
                str = "\(value) per hour"
            case let .Salary(value):
                str = "\(value) per year"
            }
            return "Job: \(title), Salary: \(str)"
        }
    }

    fileprivate var title : String
    fileprivate var type : JobType
    
    public enum JobType {
        case Hourly(Double)
        case Salary(Int)
    }
    
    public init(title : String, type : JobType) {
        self.title = title
        self.type = type
    }
    
    open func calculateIncome(_ hours: Int) -> Int {
        switch type {
        case let .Hourly(value):
            let res = value * Double(hours)
            return Int(res)
        case let .Salary(value):
            return value
        }
    }
    
    open func raise(_ amt : Double) {
        switch type {
        case let .Hourly(value):
            type = JobType.Hourly(value + amt)
        case let .Salary(value):
            type = JobType.Salary(value + Int(amt))
        }
    }
}

////////////////////////////////////
// Person
//
open class Person: CustomStringConvertible{
    
    var description: String {
        get {
            return self.toString()
        }
    }

    open var firstName : String = ""
    open var lastName : String = ""
    open var age : Int = 0
    
    fileprivate var _job : Job? = nil
    open var job : Job? {
        get {
            return _job
        }
        set(value) {
            if self.age >= 16 {
                _job = value
            }
        }
    }
    
    fileprivate var _spouse : Person? = nil
    open var spouse : Person? {
        get {
            return _spouse
        }
        set(value) {
            if self.age >= 18 {
                _spouse = value
            }
        }
    }
    
    public init(firstName : String, lastName: String, age : Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    open func toString() -> String {
        var jobStr = "nil"
        var spoStr = "nil"
        if let j = job {
            jobStr = j.title
        }
        if let s = spouse {
            spoStr = s.firstName
        }
        return "[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(jobStr) spouse:\(spoStr)]"
    }
}

////////////////////////////////////
// Family
//
open class Family: CustomStringConvertible {
    
    var description: String {
        get {
            var str = ""
            for member in members {
                str += member.firstName + " " + member.lastName + ", "
            }
            return "Members: \(str)Household Income: \(self.householdIncome())"
        }
    }

    fileprivate var members : [Person] = []
    
    public init(spouse1: Person, spouse2: Person) {
        if spouse1.spouse == nil && spouse2.spouse == nil && (spouse1.age > 21 || spouse2.age > 21 ){
            spouse1.spouse = spouse2
            spouse2.spouse = spouse1
            members.append(spouse1)
            members.append(spouse2)
        }
    }
    
    open func haveChild(_ child: Person) -> Bool {
        members.append(child)
        return true
    }
    
    open func householdIncome() -> Int {
        var income = 0
        for person in members {
            if let val = person.job {
                income += val.calculateIncome(2000)
            }
        }
        return income
    }
}

























