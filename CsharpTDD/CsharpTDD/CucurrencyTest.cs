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
            Assert.True(Money.Franc(5).Equals(Money.Franc(5)));
            Assert.False(Money.Franc(5).Equals(Money.Franc(6)));
            Assert.False(Money.Franc(5).Equals(Money.Dollor(5)));
        }

        [Fact]
        public void TestCurrencyString()
        {
            Assert.Equal("USD", Money.Dollor(1).Currency());
            Assert.Equal("CHF", Money.Franc(1).Currency());
        }
    }
}
