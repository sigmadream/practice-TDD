struct Dollor {
    
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func times(multiplier: Int) -> Dollor {
        return Dollor(amount: amount * multiplier)
    }
    
}

struct Franc {
    
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func times(multiplier: Int) -> Franc {
        return Franc(amount: amount * multiplier)
    }
    
}

extension Dollor : Equatable {
    public static func ==(lhs: Dollor, rhs: Dollor) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}

extension Franc : Equatable {
    public static func ==(lhs: Franc, rhs: Franc) -> Bool {
        return (lhs.amount == rhs.amount) && (type(of: lhs) == type(of: rhs))
    }
}
