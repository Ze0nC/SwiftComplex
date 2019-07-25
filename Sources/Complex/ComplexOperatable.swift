//
//  ComplexOperatable.swift
//  
//
//  Created by czj on 2019/07/21.
//

import Foundation


public protocol ComplexAdditiveArithmetic {
    static func + (lhs: Self, rhs: Complex) -> Complex
    static func + (lhs: Complex, rhs: Self) -> Complex
    static func - (lhs: Self, rhs: Complex) -> Complex
    static func - (lhs: Complex, rhs: Self) -> Complex
}

public protocol ComplexMultiplicativeArithmetic {
    static func * (lhs: Self, rhs: Complex) -> Complex
    static func * (lhs: Complex, rhs: Self) -> Complex
    static func / (lhs: Self, rhs: Complex) -> Complex
    static func / (lhs: Complex, rhs: Self) -> Complex
}

public typealias ComplexOperatable = ComplexAdditiveArithmetic & ComplexMultiplicativeArithmetic


