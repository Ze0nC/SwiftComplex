//
//  ComplexOperatable.swift
//  
//
//  Created by czj on 2019/07/21.
//

import Foundation


protocol ComplexAdditiveArithmetic {
    static func + (lhs: Self, rhs: Complex) -> Complex
    static func + (lhs: Complex, rhs: Self) -> Complex
    static func - (lhs: Self, rhs: Complex) -> Complex
    static func - (lhs: Complex, rhs: Self) -> Complex
}

protocol ComplexMultiplicativeArithmetic {
    static func * (lhs: Self, rhs: Complex) -> Complex
    static func * (lhs: Complex, rhs: Self) -> Complex
    static func / (lhs: Self, rhs: Complex) -> Complex
    static func / (lhs: Complex, rhs: Self) -> Complex
}

typealias ComplexOperatable = ComplexAdditiveArithmetic & ComplexMultiplicativeArithmetic


