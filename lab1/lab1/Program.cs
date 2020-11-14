using System;

namespace Lab1_1
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            const string path = "/Users/sugardaddy/Desktop/OOP_2020/Lab1_1/Lab1_1/input.ini";
            const string wrongIniPath = "/Users/sugardaddy/Desktop/OOP_2020/Lab1_1/Lab1_1/wrong.ini";
            var test = new Test();
            test.test_equal(path);
            test.test_parse_exception(path);
            test.test_file_exception(path);
            test.test_ini_format_exception(wrongIniPath);
        }
    }
}
