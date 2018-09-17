using System;
using System.Collections.Generic;
using System.Text;

namespace CsharpTDD
{
    public abstract class Money
    {
        internal int amount;

        public abstract Money Times(int multiplier);

        public static Money Dollor(int amout)
        {
            return new Dollar(amout);
        }

        public static Money Franc(int amout)
        {
            return new Franc(amout);
        }


        public override bool Equals(object obj)
        {
            Money money = (Money)obj;
            return amount == money.amount && GetType().Equals(money.GetType());
        }
    }
}
