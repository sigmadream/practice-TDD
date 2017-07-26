class Money {
    fileprivate let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }

}


class Dollor: Money {
    
    func times(multiplier: Int) -> Dollor {
        return Dollor(amount: amount * multiplier)
    }
    
}


class Franc: Money {
    
    func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }
    
}

extension Money : Equatable {
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
