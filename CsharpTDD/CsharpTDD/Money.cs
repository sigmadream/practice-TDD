using System;
using System.Collections.Generic;
using System.Text;

namespace CsharpTDD
{
    internal class Money : IExpression
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
            return new Money(amout, "USD");
        }

        public static Money Franc(int amout)
        {
            return new Money(amout, "CHF");
        }

        public override bool Equals(object obj)
        {
            Money money = (Money)obj;
            return amount == money.amount && Currency().Equals(money.Currency());
        }

        public IExpression plus(Money addend)
        {
            return new Money(amount + addend.amount, currency);
        }
    }
}
