//
//  File.swift
//  
//
//  Created by czj on 2019/07/25.
//

import Foundation

extension Double: ComplexOperatable {
    public static func - (lhs: Complex, rhs: Double) -> Complex {
        return Complex(lhs.real - rhs, lhs.imag)
    }
    
    public static func - (lhs: Double, rhs: Complex) -> Complex {
        return Complex(lhs - rhs.real, -rhs.imag)
    }
    
    public static func + (lhs: Double, rhs: Complex) -> Complex {
        return Complex(rhs.real + lhs, rhs.imag)
    }
    
    public static func + (lhs: Complex, rhs: Double) -> Complex {
        return Complex(lhs.real + rhs, lhs.imag)
    }
    
    public static func * (lhs: Double, rhs: Complex) -> Complex {
        return Complex(rhs.real * lhs, rhs.imag * lhs)
    }
    
    public static func * (lhs: Complex, rhs: Double) -> Complex {
        return Complex(lhs.real * rhs, lhs.imag * rhs)
    }
    
    public static func / (lhs: Double, rhs: Complex) -> Complex {
        let rhs_norm² = rhs.norm²
        return Complex(
            lhs * rhs.real / rhs_norm²,
            lhs * -rhs.imag / rhs_norm²
        )
    }
    
    public static func / (lhs: Complex, rhs: Double) -> Complex {
        return Complex(lhs.real / rhs, lhs.imag / rhs)
    }
}
