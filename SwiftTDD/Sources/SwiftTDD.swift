protocol Expression {
    
    func reduce(bank: Bank, to: String) -> Money
    
}

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

    
    static func +(lhs: Money, rhs: Money) -> Expression {
        return Sum(augend: lhs, addend: rhs)
    }
    
    class func dollar(amount: Int) -> Money {
        return Money(amount: amount, currency: "USD")
    }
    
    class func franc(amount: Int) -> Money {
        return Money(amount: amount, currency: "CHF")
    }
    
    

}

class Bank {
    
    var rates: [Pair: Int] = [:]
    
    
    func reduce(source: Expression, to: String) -> Money {
        return source.reduce(bank: self, to: to)
    }
    
    func addRate(from: String, to: String, rate: Int) {
        self.rates[Pair(from: from, to: to)] = rate
    }
    
    func rate(from: String, to: String) -> Int {
        if from == to {
            return 1
        }
        
        guard let rate = self.rates[Pair(from: from, to: to)] else {
            fatalError()
        }
        
        return rate
    }
    
}

struct Sum : Expression {
    
    let augend: Money
    let addend: Money
    
    func reduce(bank: Bank, to: String) -> Money {
        return Money(amount: self.augend.amount + self.addend.amount, currency: to)
    }
    
}

extension Money : Expression {
    
    func reduce(bank: Bank, to: String) -> Money {
        let rate = bank.rate(from: self.currency, to: to)
        return Money(amount: self.amount / rate, currency: to)
    }
    
}

extension Money : Equatable {
    
    public static func ==(lhs: Money, rhs: Money) -> Bool {
        return (lhs.amount == rhs.amount) && (lhs.currency == rhs.currency)
    }
    
}


struct Pair {
    let from: String
    let to: String
}

extension Pair: Hashable {
    
    public static func ==(lhs: Pair, rhs: Pair) -> Bool{
        return lhs.from == rhs.from && lhs.to == rhs.to
    }
    
    var hashValue: Int {
        return 0
    }
}



