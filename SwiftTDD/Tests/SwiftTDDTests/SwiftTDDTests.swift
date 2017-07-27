import XCTest
@testable import SwiftTDD

class SwiftTDDTests: XCTestCase {
    
    func testMultiplication() {
        let five = Money.dollar(amount: 5)
        XCTAssertEqual(Money.dollar(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Money.dollar(amount: 15), five.times(multiplier: 3))
    }
    
    func testFrancMultiplication() {
        let five = Money.franc(amount: 5)
        XCTAssertEqual(Money.franc(amount: 10), five.times(multiplier: 2))
        XCTAssertEqual(Money.franc(amount: 15), five.times(multiplier: 3))
    }
    
    func testEquality() {
        XCTAssertTrue(Money.dollar(amount: 5) == Money.dollar(amount: 5))
        XCTAssertFalse(Money.dollar(amount: 5) == Money.dollar(amount: 6))
        XCTAssertFalse(Money.dollar(amount: 6) == Money.franc(amount: 6))
    }
    
    func testCurrency() {
        XCTAssertEqual("USD", Money.dollar(amount: 1).currency)
        XCTAssertEqual("CHF", Money.franc(amount: 1).currency)
    }
    
    func testSimpleAddition() {
        let five = Money.dollar(amount: 5)
        let sum = five + five
        let bank = Bank()
        let reduced = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(amount: 10), reduced)
    }
    
    func testPlusReturnSum() {
        let five = Money.dollar(amount: 5)
        let result = five + five
        let sum = result as? Sum
        XCTAssertEqual(Optional(five), sum?.augend)
        XCTAssertEqual(Optional(five), sum?.addend);
    }
    
    func testReduceSum() {
        let sum = Sum(augend: Money.dollar(amount: 3), addend: Money.dollar(amount: 4))
        let bank = Bank()
        let result = bank.reduce(source: sum, to: "USD")
        XCTAssertEqual(Money.dollar(amount: 7), result)
    }
    
    func testReduceMoney() {
        let bank = Bank()
        let result = bank.reduce(source: Money.dollar(amount: 1), to: "USD")
        XCTAssertEqual(Money.dollar(amount: 1), result)
    }
    

//    static var allTests = [
//        ("testExample", testExample),
//    ]
    
}
