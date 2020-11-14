using System;
using System.Collections.Generic;

namespace Lab1_1
{
    public class Data
    {
        private Dictionary<string, Dictionary<string, string>> _map;

        public Data(Dictionary<string, Dictionary<string, string>> map)
        {
            _map = map;
        }

        public int TryGetInt(string sector, string property)
        {
            if (!_map.ContainsKey(sector))
            {
                throw new Exception("Sector " + sector + " is not presented in the collection");
            } else if (!_map[sector].ContainsKey(property))
            {
                throw new Exception("Property " + property + " is not presented in the collection");
            }
            
            if (!Int32.TryParse(_map[$"{sector}"][$"{property}"], out int n))
            {
                throw new Exception("Failed to parse: int");
            }
            
            return n;
        }

        public double TryGetDouble(string sector, string property)
        {
            if (!_map.ContainsKey(sector))
            {
                throw new Exception("Sector " + sector + " is not presented in the collection");
            } else if (!_map[sector].ContainsKey(property))
            {
                throw new Exception("Property " + property + " is not presented in the collection");
            }
            if (!Double.TryParse(_map[$"{sector}"][$"{property}"], out double n))
            {
                throw new Exception("Failed to parse: double");
            }

            return n;
        }

        public string TryGetString(string sector, string property)
        {
            if (!_map.ContainsKey(sector))
            {
                throw new Exception("Sector " + sector + " is not presented in the collection");
            } else if (!_map[sector].ContainsKey(property))
            {
                throw new Exception("Property " + property + " is not presented in the collection");
            }
            if (Double.TryParse(_map[$"{sector}"][$"{property}"], out double n))
            {
                throw new Exception("Failed to parse: string");
            }

            return _map[$"{sector}"][$"{property}"];
        }
    }
}