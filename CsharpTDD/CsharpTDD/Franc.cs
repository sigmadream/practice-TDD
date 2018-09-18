namespace CsharpTDD
{
    internal class Franc: Money
    {
        public Franc(int amount, string currency): base(amount, currency)
        {
        }

        protected internal override Money Times(int multiplier)
        {
            return Money.Franc(amount * multiplier);
        }

    }
}