//
//  Complex.swift
//  Swift-Complex
//
//  Created by czj on 2019/07/21.
//  Copyright © 2019 Zhijin Chen. All rights reserved.
//

import Foundation

public struct Complex {
    public var real, imag: Double
    
    /// Create a complex number of real + imag * i.
    public init(_ real: Double, _ imag: Double) {
            self.real = real
            self.imag = imag
    }
    
    /// Create a complex number of r * cos(θ) + r * sin(θ) * i.
    public init(r: Double, θ: Double) {
        self.real = r * cos(θ)
        self.imag = r * sin(θ)
    }
    
    /// Return the r value in r*cos(θ)+r*sin(θ)*i corresponds to the complex.
    /// This is the same as norm.
    @inline(__always) public var r : Double {
        return self.norm
    }
    
    /// Return the θ angle in r*cos(θ)+r*sin(θ)*i corresponds to the complex.
    /// Returns nil if complex is zero.
    public var θ: Double? {
        if self.real > 0.0 || self.imag != 0.0 {
            return 2 * atan(self.imag / (self.norm + self.real))
        } else if self.real < 0.0 && self.imag == 0.0 {
            return Double.pi
        }
        return nil
    }
    
    /// Return the norm of the complex.
    var norm: Double {
        return sqrt(self.real * self.real + self.imag * self.imag)
    }
    
    /// Return the norm squared of the complex.
    var norm²: Double {
        return self.real * self.real + self.imag * self.imag
    }
    
    /// Return the conjugated complex of the complex.
    var conj: Complex {
        return Complex(self.real, -self.imag)
    }
}

extension Complex: AdditiveArithmetic {
    public static var zero : Complex {
        return Complex(0.0, 0.0)
    }
    
    public mutating func added(_ c: Complex) {
        self.real += c.real
        self.imag += c.imag
    }
    
    public static prefix func +(c: Complex) -> Complex {
        return Complex(c.real, c.imag)
    }

    public static func + (lhs: Self, rhs: Complex) -> Complex {
        return Complex(lhs.real + rhs.real, lhs.imag + rhs.imag)
    }
    
    public static func += (lhs: inout Complex, rhs: Complex) {
        lhs.real = lhs.real + rhs.real
        lhs.imag = lhs.imag * rhs.imag
    }
    
    public mutating func subtracted(_ c: Complex) {
        self.real -= c.real
        self.imag -= c.imag
    }
    
    public static func - (lhs: Self, rhs: Complex) -> Complex {
        return Complex(lhs.real - rhs.real, lhs.imag - rhs.imag)
    }
    
    public static func -= (lhs: inout Complex, rhs: Complex) {
        lhs = lhs - rhs
    }
}

extension Complex: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self.real = Double(value)
        self.imag = 0.0
    }
    
    public typealias IntegerLiteralType = Int
}

extension Complex: Numeric {
    public init?<T>(exactly source: T) where T : BinaryInteger {
        self.real = Double(source)
        self.imag = 0.0
    }
    
    public typealias Magnitude = Double
    
    public var magnitude: Double {
        return self.norm
    }
    
    public mutating func multiplied(_ c: Complex) {
        self.real = self.real * c.real - self.imag * c.imag
        self.imag = self.real * c.imag + self.imag * c.real
    }
    
    public static func * (lhs: Complex, rhs: Complex) -> Complex {
        return Complex(
            lhs.real * rhs.real - lhs.imag * rhs.imag,
            lhs.real * rhs.imag + lhs.imag * rhs.real
        )
    }
    
    public static func *= (lhs: inout Complex, rhs: Complex) {
        lhs.real = lhs.real * rhs.real - (lhs.imag * rhs.imag)
        lhs.imag = lhs.real * rhs.imag + lhs.imag * rhs.real
    }
}

extension Complex: SignedNumeric {
    public static prefix func -(c: Complex) -> Complex {
        return Complex(-c.real, -c.imag)
    }
}

extension Complex : Equatable {
    public static func ==(lhs: Complex, rhs: Complex) -> Bool {
        return lhs.real == rhs.real && lhs.imag == rhs.imag
    }
    
    public static func !=(lhs: Complex, rhs: Complex) -> Bool {
        return lhs.real != rhs.real || lhs.imag != rhs.imag
    }
    
    public static func ==(lhs: Double, rhs: Complex) -> Bool {
        return lhs == rhs.real && rhs.imag == 0.0
    }
    public static func ==(lhs: Complex, rhs: Double) -> Bool {
        return lhs.real == rhs && lhs.imag == 0.0
    }
    
    public static func !=(lhs: Double, rhs: Complex) -> Bool {
        return lhs != rhs.real || rhs.imag != 0.0
    }
    
    public static func !=(lhs: Complex, rhs: Double) -> Bool {
        return lhs.real != rhs || lhs.imag != 0.0
    }
}

extension Complex {
    public mutating func divided(_ c: Complex) {
        let c_norm² = c.norm²
        self.real = self.real * c.real / c_norm² - self.imag * -c.imag / c_norm²
        self.imag = self.real * -c.imag / c_norm² + self.imag * c.real / c_norm²
    }
    
    public static func / (lhs: Complex, rhs: Complex) -> Complex {
        let rhs_norm² = rhs.norm²
        return Complex(
            lhs.real * rhs.real / rhs_norm² - lhs.imag * -rhs.imag / rhs_norm²,
            lhs.real * -rhs.imag / rhs_norm² + lhs.imag * rhs.real / rhs_norm²
        )
    }
}

extension Complex: CustomDebugStringConvertible, CustomStringConvertible, Codable, Hashable {
    public var debugDescription: String {
        return "Complex(\(self.real), \(self.imag))"
    }
    
    public var description: String {
        return "\(self.real) \(self.imag >= 0.0 ? "+" : "-") \(self.imag)i"
    }
    
}

// Random Number
extension Complex {
    /// Return a random number in specific range.
    public static func random(real realRange: ClosedRange<Double>, imag imagRange: ClosedRange<Double>) -> Complex {
        return Complex(
            Double.random(in: realRange),
            Double.random(in: imagRange)
        )
    }
    
    /// Return a random number in specific range.
    public static func random(real realRange: Range<Double>, imag imagRange: ClosedRange<Double>) -> Complex {
            return Complex(
                Double.random(in: realRange),
                Double.random(in: imagRange)
            )
        }
    
    /// Return a random number in specific range.
    public static func random(real realRange: ClosedRange<Double>, imag imagRange: Range<Double>) -> Complex {
            return Complex(
                Double.random(in: realRange),
                Double.random(in: imagRange)
            )
        }
    
    /// Return a random number in specific range.
    public static func random(real realRange: Range<Double>, imag imagRange: Range<Double>) -> Complex {
            return Complex(
                Double.random(in: realRange),
                Double.random(in: imagRange)
            )
        }
}

extension Double {
    public var i : Complex {
        return Complex(0.0, self)
    }
}

// Math

public func c_sqrt(_ d: Double) -> Complex {
    if d >= 0.0 {
        return Complex(sqrt(d), 0.0)
    } else {
        return Complex(0.0, sqrt(-d))
    }
}

public func c_sqrt(_ c: Complex) -> Complex {
    let r = c.r
    if let θ = c.θ {
        return Complex(r: sqrt(r), θ: θ/2.0)
    } else {
        return Complex.zero
    }
}

public func sin(_ c: Complex) -> Complex {
    return Complex(
        sin(c.real) * cosh(c.imag),
        cos(c.real) * sinh(c.imag)
    )
}

public func cos(_ c: Complex) -> Complex {
    return Complex(
            cos(c.real) * cosh(c.imag),
            -sin(c.real) * sinh(c.imag)
        )
}

public func tan(_ c: Complex) -> Complex {
    return Complex(sin(c.real) * cosh(c.imag), cos(c.real)*sinh(c.imag)) / Complex(cos(c.real)*cosh(c.imag), -sin(c.real) * sinh(c.imag))
}

public func cot(_ c: Complex) -> Complex {
    return Complex(cos(c.real) * cosh(c.imag), -sin(c.real)*sinh(c.imag)) / Complex(sin(c.real)*cosh(c.imag), cos(c.real) * sinh(c.imag))
}


public func log(_ c: Complex) -> Complex {
    return Complex(
        log(c.norm),
        c.θ ?? 0.0
    )
}

public func exp(_ c: Complex) -> Complex {
    return Complex(
        exp(c.real) * cos(c.imag),
        exp(c.real) * sin(c.imag)
    )
}

public func pow(_ a: Complex, _ b: Complex) -> Complex {
    return Complex(
            exp(b.real * log(a.norm) - b.imag * (a.θ ?? 0.0)) * cos(b.real * (a.θ ?? 0.0) + b.imag * log(a.norm)),
            exp(b.real * log(a.norm) - b.imag * (a.θ ?? 0.0)) * sin(b.real * (a.θ ?? 0.0) + b.imag * log(a.norm))
        )
}

public func pow(_ a: Double, _ b: Complex) -> Complex {
    return Complex(
                exp(b.real * log(a)) * cos(b.imag * log(a)),
                exp(b.real * log(a)) * sin(b.imag * log(a))
            )
}

public func pow(_ a: Complex, _ b: Double) -> Complex {
    return Complex(
                exp(b * log(a.norm)) * cos(b * (a.θ ?? 0.0)),
                exp(b * log(a.norm)) * sin(b * (a.θ ?? 0.0))
            )
}



/*
public mutating func added(_ d: Double) {
        self.real += d
    }

 public mutating func subtracted(_ d: Double) {
     self.real -= d
 }
*/

