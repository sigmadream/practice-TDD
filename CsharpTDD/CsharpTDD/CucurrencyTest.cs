using System;
using Xunit;

namespace CsharpTDD
{
    public class CucurrencyTest
    {
        [Fact]
        public void TestMultiplication() 
        {
            Money five = Money.Dollor(5);
            Assert.Equal(Money.Dollor(10), five.Times(2));
            Assert.Equal(Money.Dollor(15), five.Times(3));
        }

        [Fact]
        public void TestFrancMultiplication()
        {
            Money five = Money.Franc(5);
            Assert.Equal(Money.Franc(10), five.Times(2));
            Assert.Equal(Money.Franc(15), five.Times(3));
        }


        [Fact]
        public void TestEquality()
        {
            Assert.True(Money.Dollor(5).Equals(Money.Dollor(5)));
            Assert.False(Money.Dollor(5).Equals(Money.Dollor(6)));
            Assert.False(Money.Franc(5).Equals(Money.Dollor(5)));
        }

        [Fact]
        public void TestCurrencyString()
        {
            Assert.Equal("USD", Money.Dollor(1).Currency());
            Assert.Equal("CHF", Money.Franc(1).Currency());
        }

        [Fact]
        public void TestSimpleAddition()
        {
            Money five = Money.Dollor(5);
            IExpression sum = five.Plus(five);
            Bank bank = new Bank();
            Money reduced = bank.Reduce(sum, "USD");
            Assert.Equal(Money.Dollor(10), reduced);
        }

        [Fact]
        public void testPlusReturnsSum()
        {
            Money five = Money.Dollor(5);
            IExpression result = five.Plus(five);
            Sum sum = (Sum)result;
            Assert.Equal(five, sum.augend);
            Assert.Equal(five, sum.addend);
        }

        [Fact]
        public void testReduceSum() 
        {
            IExpression sum = new Sum(Money.Dollor(3), Money.Dollor(4));
            Bank bank = new Bank();
            Money result = bank.Reduce(sum, "USD");
            Assert.Equal(Money.Dollor(7), result);
        }

        [Fact]
        public void testReduceMoney()
        {
            Bank bank = new Bank();
            Money result = bank.Reduce(Money.Dollor(1), "USD");
            Assert.Equal(Money.Dollor(1), result);
        }

        [Fact]
        public void testIdentityRate()
        {
            Assert.Equal(1, new Bank().rate("USD", "USD"));
        }

        [Fact]
        public void testReduceMoneyDifferenctCurrency() 
        {
            Bank bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            Money result = bank.Reduce(Money.Franc(2), "USD");
            Assert.Equal(Money.Dollor(1), result);
        }

        [Fact]
        public void testArrayEquals()
        {
            Assert.Equal(new Object[] { "abc" }, new Object[] { "abc" });
        }

    }
}
