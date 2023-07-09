package com.sangkon;

public class Money {
    protected int amount;
    protected String currnecy;

    public Money(int amount, String currnecy) {
        this.amount = amount;
        this.currnecy = currnecy;
    }


    public static Dollar dollar(int amount) {
        return new Dollar(amount, "USD");
    }

    public static Franc franc(int amount) {
        return new Franc(amount, "CHF");
    }


    public Money times(int multiplier) {
        return new Money(amount * multiplier, currnecy);
    }

    public String currency() {
        return currnecy;
    }

    @Override
    public boolean equals(Object o) {
        Money money = (Money) o;
        return amount == money.amount && currency().equals(money.currnecy);
    }

    @Override
    public String toString() {
        return "Money{" +
                "amount=" + amount +
                ", currnecy='" + currnecy + '\'' +
                '}';
    }
}
