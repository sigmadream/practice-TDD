import XCTest
@testable import SwiftTDD

class SwiftTDDTests: XCTestCase {
    
    func testMultiplication() {
        let five = Dollor(amount: 5)
        XCTAssertEqual(Dollor(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Dollor(amount: 15), five.times(multiplier: 3))
    }
    
    func testFrancMultiplication() {
        let five = Franc(amount: 5)
        XCTAssertEqual(Franc(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Franc(amount: 15), five.times(multiplier: 3))
    }
    
    func testEquality() {
        XCTAssertTrue(Dollor(amount: 5) == Dollor(amount: 5))
        XCTAssertFalse(Dollor(amount: 5) == Dollor(amount: 6))
        XCTAssertTrue(Franc(amount: 5) == Franc(amount: 5))
        XCTAssertFalse(Franc(amount: 5) == Franc(amount: 6))
        XCTAssertFalse(Dollor(amount: 6) == Franc(amount: 6))
    }

//    static var allTests = [
//        ("testExample", testExample),
//    ]
    
}
