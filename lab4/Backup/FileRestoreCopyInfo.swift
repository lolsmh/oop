//
//  FileRestoreCopyInfo.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//

class FileRestoreCopyInfo {
    var Name: String;
    var Size: Int;
    var Date: String;
    
    init(_ name: String, _ size: Int, _ date: String) {
        self.Name = "\(name)_backup_\(date)"
        self.Size = size
        self.Date = date
    }
    
    init(size: Int, name: String) {
        self.Date = MyDate.now()
        self.Size = size
        self.Name = name
    }
}
