package com.sangkon;

public class Money implements Expression {
    protected int amount;
    protected String currency;

    public Money(int amount, String currnecy) {
        this.amount = amount;
        this.currency = currnecy;
    }

    public String currency() {
        return currency;
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
        return new Money(amount * multiplier, currency);
    }

    public Money reduce(Bank bank, String to) {
        int rate = bank.rate(currency, to);
        return new Money(amount / rate, to);
    }


    @Override
    public boolean equals(Object o) {
        Money money = (Money) o;
        return amount == money.amount && currency().equals(money.currency);
    }

    @Override
    public String toString() {
        return "Money{" + "amount=" + amount + ", currnecy='" + currency + '\'' + '}';
    }
}
