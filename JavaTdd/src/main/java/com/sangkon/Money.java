package com.sangkon;

abstract class Money {
    protected int amount;

    @Override
    public boolean equals(Object o) {
        Money money = (Money) o;
        return amount == money.amount && getClass().equals(money.getClass());
    }

    public static Dollar dollar (int amount) {
        return new Dollar(amount);
    }

    public static Franc franc (int amount) {
        return new Franc(amount);
    }


    abstract Money times(int multiplier);

}
