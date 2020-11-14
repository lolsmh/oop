//
//  FileInfo.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//

class FileInfo {
    var Path: String;
    var Size: Int;
    var Name: String;
    
    init(_ filePath: String) {
        self.Path = filePath
        self.Size = Int.random(in: 0...100)
        self.Name = String(filePath[filePath.index(filePath.lastIndex(of: "/")!, offsetBy: 1)..<filePath.endIndex])
    }
    
    func getInfo() {
        print("Name: \(self.Name)")
        print("Size: \(self.Size) mb")
    }
    
    func change() {
        self.Size = Int.random(in: 0...100)
    }

}
