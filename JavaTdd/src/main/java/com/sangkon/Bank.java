package com.sangkon;

import java.util.Hashtable;

public class Bank {

    private Hashtable rates = new Hashtable();


    public void addRate(String from, String to, int rate) {
        rates.put(new Pair(from, to), rate);
    }

    public int rate(String from, String to) {
        if (from.equals(to)) return 1;
        int rate = (int) rates.get(new Pair(from, to));
        return rate;
    }

    public Money reduce(Expression source, String to) {
        return source.reduce(this, to);
    }

}
