package com.sangkon;

abstract class Money {
    protected int amount;
    protected String currnecy;

    public Money(int amount, String currnecy) {
        this.amount = amount;
        this.currnecy = currnecy;
    }

    @Override
    public boolean equals(Object o) {
        Money money = (Money) o;
        return amount == money.amount && getClass().equals(money.getClass());
    }

    public static Dollar dollar(int amount) {
        return new Dollar(amount, "USD");
    }

    public static Franc franc(int amount) {
        return new Franc(amount, "CHF");
    }


    abstract Money times(int multiplier);

    public String currency() {
        return currnecy;
    }
}
