using System;
using System.Collections.Generic;
using System.Text;

namespace CsharpTDD
{
    internal class Money
    {
        internal int amount;

        public override bool Equals(object obj)
        {
            Money money = (Money)obj;
            return amount == money.amount;
        }
    }
}
