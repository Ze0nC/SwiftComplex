import XCTest
@testable import SwiftComplex

final class SwiftComplexTests: XCTestCase {
    func testComplex() {
        let c1 = Complex(1.0, 2.0)
        let c2 = 3.0 + 4.0.i
        let c3 = Complex.random(real: -1...1, imag: -1...1)
        let c4 = Complex.random(real: -1...1, imag: -1...1)
        
        XCTAssertFalse(c3 == c4)
        
        XCTAssertTrue(1.0.i * 1.0.i == -1.0)
        XCTAssertEqual(1.0.i * 1.0.i, Complex(-1.0, 0.0))
        XCTAssertEqual(c1.norm², 5.0)
        XCTAssertEqual(c1.norm, sqrt(5.0))

        XCTAssertEqual(c1.θ!, 1.107148717794090, accuracy:1e-10)
        XCTAssertEqual(c1 * 2, Complex(2.0, 4.0))
        XCTAssertEqual(c1 + c2, Complex(4.0, 6.0))
        XCTAssertEqual(c1 - c2, Complex(-2.0, -2.0))
        XCTAssertEqual(c1 * c2, Complex(-5.0, 10.0))
        
        XCTAssertEqual(c_sqrt(-42.0).imag, sqrt(42), accuracy: 1e-10)
        
        XCTAssertEqual(c_sqrt(c1).real, 1.272019649514, accuracy: 1e-10)
        XCTAssertEqual(c_sqrt(c1).imag, 0.786151377757, accuracy: 1e-10)
        
        XCTAssertEqual((c1 / c2).real, 0.44, accuracy: 1e-10)
        XCTAssertEqual((c1 / c2).imag, 0.08, accuracy: 1e-10)
        
        XCTAssertEqual(Complex(r: 1, θ: Double.pi / 2).real, 0.0, accuracy: 1e-10)
        XCTAssertEqual(Complex(r: 1, θ: Double.pi / 2).imag, 1.0, accuracy: 1e-10)
        
        XCTAssertEqual(log(c1).real, 0.804718956217, accuracy: 1e-10)
        XCTAssertEqual(log(c1).imag, 1.107148717794, accuracy: 1e-10)
        
        XCTAssertEqual(exp(c1).real, -1.13120438375, accuracy: 1e-10)
        XCTAssertEqual(exp(c1).imag, 2.471726672004, accuracy: 1e-10)
        
        XCTAssertEqual(pow(c1, c2).real, 0.129009594074, accuracy: 1e-10)
        XCTAssertEqual(pow(c1, c2).imag, 0.033924092905, accuracy: 1e-10)
        
        XCTAssertEqual(pow(c1, 42.0).real, -387075408075603, accuracy: 1e1)
        XCTAssertEqual(pow(c1, 42.0).imag, 278471369994004, accuracy: 1e1)
        
        XCTAssertEqual(pow(42.0, c1).real, 15.52569355952090, accuracy: 1e-10)
        XCTAssertEqual(pow(42.0, c1).imag, 39.0250283727744, accuracy: 1e-10)
        
        XCTAssertEqual(sin(c1).real, 3.165778513216, accuracy: 1e-10)
        XCTAssertEqual(sin(c1).imag, 1.959601041421, accuracy: 1e-10)
        
        XCTAssertEqual(cos(c1).real, 2.032723007019, accuracy: 1e-10)
        XCTAssertEqual(cos(c1).imag, -3.05189779915, accuracy: 1e-10)
        
        XCTAssertEqual(tan(c1).real, 0.033812826079, accuracy: 1e-10)
        XCTAssertEqual(tan(c1).imag, 1.014793616146, accuracy: 1e-10)
        
        XCTAssertEqual(cot(c1).real, 0.032797755533, accuracy: 1e-10)
        XCTAssertEqual(cot(c1).imag, -0.98432922645, accuracy: 1e-10)
    }
    
    

    static var allTests = [
        ("testComplex", testComplex),
    ]
}
