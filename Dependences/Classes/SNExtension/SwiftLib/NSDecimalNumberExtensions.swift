//
//  NSDecimalNumberExtensions.swift
//  zshSeedOne
//
//  Created by ios-spec on 2019/4/19.
//  Copyright © 2019 zsh. All rights reserved.
//

import Foundation


postfix operator -~
infix operator **: DefaultPrecedence

extension Double {

    static postfix func -~ (lhs: Double) -> NSDecimalNumber {
        return NSDecimalNumber(value: lhs)
    }
}

extension Int {
    static postfix func -~ (lhs: Int) -> NSDecimalNumber {
        return NSDecimalNumber(value: lhs)
    }
}

extension Float {
    static postfix func -~ (lhs: Float) -> NSDecimalNumber {
        return NSDecimalNumber(value: lhs)
    }
}

extension String {
    static postfix func -~ (lhs: String) -> NSDecimalNumber {
        return NSDecimalNumber(string: lhs)
    }
}

extension NSDecimalNumber {

    static func + (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {

       return lhs.adding(rhs)
    }

    static func - (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {

        return lhs.subtracting(rhs)
    }

    static func * (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {

        return lhs.multiplying(by: rhs)
    }

    static func / (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {

        return lhs.dividing(by: rhs)
    }

    static func > (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {

        let compare = lhs.compare(rhs)
        if compare == .orderedDescending {
            return true
        } else {
            return false
        }
    }

    static func >= (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {

        let compare = lhs.compare(rhs)
        if compare == .orderedDescending || compare == .orderedSame {
            return true
        } else {
            return false
        }
    }

    static func <= (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {

        let compare = lhs.compare(rhs)
        if compare == .orderedAscending || compare == .orderedSame {
            return true
        } else {
            return false
        }
    }

    static func < (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {

        let compare = lhs.compare(rhs)
        if compare == .orderedAscending {
            return true
        } else {
            return false
        }
    }

    static func == (lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {

        let compare = lhs.compare(rhs)
        if  compare == .orderedSame {
            return true
        } else {
            return false
        }
    }

    static func ** (lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber {

        return lhs.multiplying(byPowerOf10: Int16(rhs))
    }
}

