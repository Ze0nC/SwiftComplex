# SwiftComplex

Complex Number for Swift 5 with Swift Package Manager support. 

## struct
````swift
public struct Complex: SignedNumeric{
    public var real, imag: Double
}
````

## Installation 
Method 1: Add this git to your Xcode project by `File > Swift Packages > Add Package Dependency ...`

Method 2: Add `Complex.swift`, `ComplexOperatable.swift`, and `Double+Complex.swift` to your project and build.

## Usage
### Import
````swift
import Complex
````

### Create Complex
````swift
let c1 = Complex(1.0, 2.0)          // 1.0 + 2.0i
let c2 = 3.0 + 4.0.i                // 3.0 + 4.0i
let c3 = 1.0.i                      // i
let c4 = Complex(r: 5.0, θ: 6.0)    // 5 * cos(θ) + 5 * sin(θ)i 
let zero = Complex.zero             // 0.0 + 0.0i
let random = Complex.random(real: -1...1, imag: -1...1)
                                    // random complex
````
### Get property
````swift
c1.norm                             // sqrt(5.0) = 2.236
c1.norm²                            // 5.0
c1.r                                // sqrt(5.0) = 2.236
c1.θ                                // 1.1071 
zero.θ                              // nil
c1.conj                             // 1.0 - 2.0i
````

### Basic Operations
````swift
// Operation with Complex
c1 + c2                             // 4.0 + 6.0i
c1 - c2                             // -2.0 - 2.0i
c1 * c2                             // -5.0 + 10.0i
c1 / c2                             // 0.44 + 0.08i

// Operation with Double
c1 + 42.0                           // 43.0 + 2.0i
c1 - 42.0                           // -41.0 + 2.0i
c1 * 42.0                           // 42.0 + 84.0i
c1 / 42.0                           // 0.0238 + 0.0476i

````
### Functions

```swift
c_sqrt(-42.0)                       // 6.48i
c_sqrt(c1)                          // 1.272 + 0.786i
sin(c1)                             // 3.166 + 1.960i
cos(c1)                             // 2.033 - 3.052i
tan(c1)                             // 0.034 + 1.015i
cot(c1)                             // 0.033 - 0.984i
log(c1)                             // 0.805 + 1.107i
exp(c1)                             // -1.131 + 2.471i
pow(c1, c2)                         // 0.129 + 0.034i
```

## License
This project is licensed under the terms of the MIT license.
