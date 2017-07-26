import XCTest
@testable import SwiftTDD

class SwiftTDDTests: XCTestCase {
    func testMultiplication() {
        var five = Dollor(amount: 5)
        five.times(multiplier: 2)
        XCTAssertEqual(10, five.amount)
    }

//    static var allTests = [
//        ("testExample", testExample),
//    ]
    
}
