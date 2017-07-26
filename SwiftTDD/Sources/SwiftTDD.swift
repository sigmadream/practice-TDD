struct Dollor {
    var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    func times(multiplier: Int) -> Dollor {
        return Dollor(amount: amount * multiplier)
    }
}
