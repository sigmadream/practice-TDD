package com.sangkon;

public class Money implements Expression {
    protected int amount;
    protected String currnecy;

    public Money(int amount, String currnecy) {
        this.amount = amount;
        this.currnecy = currnecy;
    }

    public String currency() {
        return currnecy;
    }

    public static Money dollar(int amount) {
        return new Money(amount, "USD");
    }

    public static Money franc(int amount) {
        return new Money(amount, "CHF");
    }

    public Expression plus(Money addend) {
        return new Sum(this, addend);
    }

    public Money times(int multiplier) {
        return new Money(amount * multiplier, currnecy);
    }

    public Money reduce(String to) {
        return this;
    }


    @Override
    public boolean equals(Object o) {
        Money money = (Money) o;
        return amount == money.amount && currency().equals(money.currnecy);
    }

    @Override
    public String toString() {
        return "Money{" + "amount=" + amount + ", currnecy='" + currnecy + '\'' + '}';
    }
}
