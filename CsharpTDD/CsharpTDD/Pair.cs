using System;
namespace CsharpTDD
{
    internal class Pair
    {
        private string from;
        private string to;

        public Pair(string from, string to)
        {
            this.from = from;
            this.to = to;
        }

        public override bool Equals(object obj)
        {
            var pair = obj as Pair;
            return from.Equals(pair.from) && to.Equals(pair.to);
        }

        public override int GetHashCode()
        {
            return 0;
        }
    }
}
