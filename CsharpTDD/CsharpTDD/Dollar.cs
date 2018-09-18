namespace CsharpTDD
{
    internal class Dollar: Money
    {
        public Dollar(int amount, string currency): base(amount, currency)
        {
        }

        protected internal override Money Times(int multiplier)
        {
            return Money.Dollor(amount * multiplier);
        }

    }
}