import Foundation

class ClientReader {
    static func fromFile(_ path: String) throws -> [[String]] {
        let task = Process()
        let pipe = Pipe()
        let command = "cat \(path)"
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/bash"
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        let outputSplitByEnter = output.split(separator: "\n")
        var outputSplitByEnterAndGaps: [[String]] = []

        for i in outputSplitByEnter{
            var line: [String] = []
            let current = i.split(separator: " ")
            for item in current {
                line.append(String(item))
            }
            outputSplitByEnterAndGaps.append(line)
        }
        return outputSplitByEnterAndGaps
    }
}
