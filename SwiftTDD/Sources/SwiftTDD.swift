class Money {
    fileprivate let amount: Int
    let currency: String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    func times(multiplier: Int) -> Money {
        return Money(amount: amount * multiplier, currency: currency)
    }
    
    class func dollar(amount: Int) -> Money {
        return Money(amount: amount, currency: "USD")
    }
    
    class func franc(amount: Int) -> Money {
        return Money(amount: amount, currency: "CHF")
    }

}

extension Money : Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.currency == rhs.currency)
    }
}
