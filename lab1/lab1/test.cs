using System;

namespace Lab1_1
{
    public class Test
    {
        private bool ASSERT_EQUAL(dynamic a, dynamic b)
        {
            return a == b;
        }
        public void test_equal(string path)
        {
            var ini = new IniParser();
            var _data = ini.Parse(path);
            Console.WriteLine(ASSERT_EQUAL(_data.TryGetDouble("ADC_DEV", "BufferLenSeconds"), 0.65));
            Console.WriteLine(ASSERT_EQUAL(_data.TryGetInt("COMMON", "StatisterTimeMs"), 5000));
            Console.WriteLine(ASSERT_EQUAL(_data.TryGetString("COMMON", "DiskCachePath"), "/sata/panorama"));
        }

        public void test_parse_exception(string path)
        {
            var ini = new IniParser();
            var _data = ini.Parse(path);
            try
            {
                _data.TryGetDouble("COMMON", "StatisterTimeMs");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            try
            {
                _data.TryGetDouble("COMMON", "DiskCachePath");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            try
            {
                _data.TryGetString("ADC_DEV", "BufferLenSeconds");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            try
            {
                _data.TryGetInt("ADC_DEV", "BufferLenSeconds");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            try
            {
                _data.TryGetInt("ADC_DEV", "JOJOFAN");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            try
            {
                _data.TryGetInt("LYKASHENKO", "BELORUSSIA");
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void test_file_exception(string path)
        {
            path = path.Remove(path.Length - 3, 3);
            path += "txt";
            var ini = new IniParser();
            try
            {
                var data = ini.Parse(path);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }

            path = path.Remove(path.Length - 4, 4);
            path += "/input.ini";
            try
            {
                var data2 = ini.Parse(path);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void test_ini_format_exception(string wrongIniPath)
        {
            try
            {
                var ini = new IniParser();
                var data = ini.Parse(wrongIniPath);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}