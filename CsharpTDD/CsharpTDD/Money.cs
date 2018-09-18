using System;
using System.Collections.Generic;
using System.Text;

namespace CsharpTDD
{
    internal abstract class Money
    {
        protected internal int amount;

        protected internal string currency;

        protected internal abstract Money Times(int multiplier);

        protected internal string Currency()
        {
            return this.currency;
        }

        protected Money(int amount, string currency)
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
            return amount == money.amount && GetType().Equals(money.GetType());
        }

    }
}
