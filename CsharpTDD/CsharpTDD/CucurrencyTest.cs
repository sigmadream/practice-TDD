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
        public void TestPlusReturnsSum()
        {
            Money five = Money.Dollor(5);
            IExpression result = five.Plus(five);
            Sum sum = (Sum)result;
            Assert.Equal(five, sum.augend);
            Assert.Equal(five, sum.addend);
        }

        [Fact]
        public void TestReduceSum() 
        {
            IExpression sum = new Sum(Money.Dollor(3), Money.Dollor(4));
            Bank bank = new Bank();
            Money result = bank.Reduce(sum, "USD");
            Assert.Equal(Money.Dollor(7), result);
        }

        [Fact]
        public void TestReduceMoney()
        {
            Bank bank = new Bank();
            Money result = bank.Reduce(Money.Dollor(1), "USD");
            Assert.Equal(Money.Dollor(1), result);
        }

        [Fact]
        public void TestIdentityRate()
        {
            Assert.Equal(1, new Bank().rate("USD", "USD"));
        }

        [Fact]
        public void TestReduceMoneyDifferenctCurrency() 
        {
            Bank bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            Money result = bank.Reduce(Money.Franc(2), "USD");
            Assert.Equal(Money.Dollor(1), result);
        }

        [Fact]
        public void TestArrayEquals()
        {
            Assert.Equal(new Object[] { "abc" }, new Object[] { "abc" });
        }

        [Fact]
        public void TestMixedAddition() {
            //IExpression fiveBucks = Money.Dollor(5);
            //IExpression tenFrances = Money.Franc(10);
            IExpression fiveBucks = Money.Dollor(5);
            IExpression tenFrances = Money.Franc(10);

            Bank bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            Money result = bank.Reduce(fiveBucks.Plus(tenFrances), "USD");
            Assert.Equal(Money.Dollor(10), result);
        }

        [Fact]
        public void TestSumPlusMoney()
        {
            IExpression fiveBucks = Money.Dollor(5);
            IExpression tenFrancs = Money.Franc(10);
            Bank bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            IExpression sum = new Sum(fiveBucks, tenFrancs).Plus(fiveBucks);
            Money result = bank.Reduce(sum, "USD");
            Assert.Equal(Money.Dollor(15), result);
        }

        [Fact]
        public void TestSumTImes() 
        {
            IExpression fiveBucks = Money.Dollor(5);
            IExpression tenFrancs = Money.Franc(10);
            Bank bank = new Bank();
            bank.AddRate("CHF", "USD", 2);
            IExpression sum = new Sum(fiveBucks, tenFrancs).Times(2);
            Money result = bank.Reduce(sum, "USD");
            Assert.Equal(Money.Dollor(20), result);

        }

        [Fact]
        public void TestPlusSameurrencyReturnsMoney()
        {
            IExpression sum = Money.Dollor(1).Plus(Money.Dollor(1));
            Assert.True(sum is Sum);
        }

    }
}
