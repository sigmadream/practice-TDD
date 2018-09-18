using System;
using System.Collections.Generic;
using System.Text;

namespace CsharpTDD
{
    internal class Money
    {
        public int amount;

        public string currency;

        public Money Times(int multiplier)
        {
            return new Money(amount * multiplier, currency);
        }

        public string Currency()
        {
            return this.currency;
        }

        public Money(int amount, string currency)
        {
            this.amount = amount;
            this.currency = currency;
        }

        public static Money Dollor(int amout)
        {
            return new Dollar(amout, "USD");
        }

        public static Money Franc(int amout)
        {
            return new Franc(amout, "CHF");
        }

        public override bool Equals(object obj)
        {
            Money money = (Money)obj;
            return amount == money.amount && Currency().Equals(money.Currency());
        }

    }
}
