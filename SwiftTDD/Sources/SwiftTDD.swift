struct Dollor {
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    mutating func times(multiplier: Int) {
        amount = amount * multiplier
    }
}
