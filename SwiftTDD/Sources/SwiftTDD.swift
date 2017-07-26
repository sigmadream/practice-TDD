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
    
    class func dollar(amount: Int) -> Dollor {
        return Dollor(amount: amount, currency: "USD")
    }
    
    class func franc(amount: Int) -> Franc {
        return Franc(amount: amount, currency: "CHF")
    }

}


class Dollor: Money {
    
    override func times(multiplier: Int) -> Money {
        return Money(amount: amount * multiplier, currency: currency)
    }
}


class Franc: Money {
    
    override func times(multiplier: Int) -> Money {
        return Money(amount: amount * multiplier, currency: currency)
    }
}

extension Money : Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.currency == rhs.currency)
    }
}
