using System.IO;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Lab1_1
{
    public class IniParser
    {
        private FileStream _file;

        private StreamReader _reader;
        
        private int HasComments(string line)
        {
            return line.IndexOf(";", StringComparison.Ordinal);
        }
        
        private string RemoveComments(string line)
        {
            return HasComments(line) != -1 ? line.Remove(HasComments(line), line.Length - HasComments(line)) : line;
        }

        private bool IsSection(string line)
        {
            return Regex.IsMatch(line, "\\[[a-zA-Z0-9_]*\\]");
        }

        private bool IsProperty(string line)
        {
            return Regex.IsMatch(line, "[a-zA-Z_0-9\\-]* *= *[a-zA-Z_0-9\\.\\-]*");
        }
        private Dictionary<string, Dictionary<string, string>> IniToMap(string path)
        { 
            if (!path.Contains(".ini"))
            { 
                throw new Exception("Wrong format of the file");
            }
        
            _file = new FileStream(path, FileMode.Open, FileAccess.ReadWrite);
            _reader = new StreamReader(_file);
            
            var tempMap = new Dictionary<string, Dictionary<string, string>>();
            string currentKey= null;
            while (!_reader.EndOfStream)
            {
                var currentLine = RemoveComments(_reader.ReadLine());
                if (string.IsNullOrEmpty(currentLine)) continue;
                if (IsSection(currentLine))
                {
                    currentKey = currentLine.Replace("[", "").Replace("]", "").Replace(" ", "");
                    try
                    {
                        tempMap.Add($"{currentKey}", new Dictionary<string, string>());
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Wrong format of ini file");
                    }
                }
                else if (IsProperty(currentLine))
                {
                    if (String.IsNullOrEmpty(currentKey))
                    {
                        throw new Exception("Wrong format of ini file");
                    }
                    string key = currentLine.Remove(currentLine.IndexOf(' '),
                        currentLine.Length - currentLine.IndexOf(' '));
                    string value = currentLine.Remove(0, currentLine.IndexOf('=') + 2).Replace(" ", "");
                    try
                    {
                        tempMap[$"{currentKey}"].Add(key, value); 
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Wrong format of ini file");
                    }
                }
                else
                {
                    throw new Exception("Wrong format of ini file");
                }
            }
            return tempMap;
        }
        public Data Parse(string path)
        {
            return new Data(IniToMap(path));
        }
    }
}