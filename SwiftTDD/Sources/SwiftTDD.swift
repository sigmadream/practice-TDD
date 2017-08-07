protocol Expression {
    func reduce(bank: Bank, to: String) -> Money
    func plus(addend: Expression) -> Expression
    func times(multiplier: Int) -> Expression
}

class Money: Expression {
    
    internal let amount: Int
    internal let currency: String
    
    init(amount: Int, currency: String) {
        self.amount = amount
        self.currency = currency
    }
    
    class func dollar(amount: Int) -> Money {
        return Money(amount: amount, currency: "USD")
    }
    
    class func franc(amount: Int) -> Money {
        return Money(amount: amount, currency: "CHF")
    }
    
    func times(multiplier: Int) -> Expression {
        return Money(amount: amount * multiplier, currency: currency)
    }
    
    func plus(addend: Expression) -> Expression {
        return Sum(augend: self, addend: addend as! Money)
    }
    
    func reduce(bank: Bank, to: String) -> Money {
        let rate = bank.rate(from: currency, to: to)
        return Money(amount: amount / rate, currency: to)
    }

}

extension Money : Equatable {
    
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.currency == rhs.currency)
    }
    
}


class Bank {
    
    var rates: [Pair: Int] = [:]
    
    
    func reduce(source: Expression, to: String) -> Money {
        return source.reduce(bank: self, to: to)
    }
    
    func addRate(from: String, to: String, rate: Int) {
        rates[Pair(from: from, to: to)] = rate
    }

    func rate(from: String, to: String) -> Int {
        if from == to { return 1 }
        let rate: Int = rates[Pair(from: from, to: to)]!
        return rate
    }
    
}

struct Sum : Expression {
    
    let augend: Expression
    let addend: Expression
    
    func reduce(bank: Bank, to: String) -> Money {
        let amount = augend.reduce(bank: bank, to: to).amount + addend.reduce(bank: bank, to: to).amount
        return Money(amount: amount, currency: to)
    }
    
    func plus(addend: Expression) -> Expression {
        return Sum(augend: self, addend: addend)
    }
    
    func times(multiplier: Int) -> Expression {
        return Sum(augend: addend.times(multiplier: multiplier), addend: addend.times(multiplier: multiplier))
    }
}


struct Pair {
    let from: String
    let to: String

    init(from: String, to: String) {
        self.from = from
        self.to = to
    }
    
    var hashValue: Int = 0
 
}

extension Pair: Hashable {
    
    public static func ==(lhs: Pair, rhs: Pair) -> Bool{
        return lhs.from == rhs.from && lhs.to == rhs.to
    }
    
}



