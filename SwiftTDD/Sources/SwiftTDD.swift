class Money {
    fileprivate let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func times(multiplier: Int) -> Money {
        return Money(amount: amount * multiplier)
    }
    
    class func dollar(amount: Int) -> Dollor {
        return Dollor(amount: amount)
    }
    
    class func franc(amount: Int) -> Franc {
        return Franc(amount: amount)
    }

}


class Dollor: Money {
    override func times(multiplier: Int) -> Dollor {
        return Dollor(amount: amount * multiplier)
    }
}


class Franc: Money {
    override func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }
}

extension Money : Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
