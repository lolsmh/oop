//
//  BackupItem.swift
//  Backup
//
//  Created by Даниил Апальков on 04.11.2020.
//

import Foundation

class BackupItem {
    var items: [RestorePoint] = []
    var name: String
    private var date = MyDate.now()
    private var mode: ([FileInfo]) -> RestorePoint
    private var i = 1;
    private var data: [FileInfo]
    
    
    init(name: String, args: [FileInfo], mode: @escaping ([FileInfo]) -> RestorePoint) {
        self.data = args
        self.items.append(mode(args))
        self.name = name
        self.mode = mode
    }
    
    func getInfo() {
        print("Name: \(self.name) ")
        print("Overall size: \(self.getSize()) mb")
        print("Creation date: \(self.date)")
        var count = 1
        for i in self.items {
            print("\tRestore \(i.date):")
            var fileCount = 1
            for j in i.list {
                print("\t\tFile \(fileCount)")
                print("\t\t\tName: \(j.Name)")
                print("\t\t\tSize: \(j.Size) mb")
                print("\t\t\tDate: \(j.Date)")
                fileCount += 1
            }
            count += 1
        }
    }
    
    func getSize() -> Int {
        var size = 0
        for i in self.items {
            size += i.getSize()
        }
        return size
    }
    
    func addRestorePoint() {
        self.items.append(mode(self.data))
    }
    
    func clear(clear: @escaping ([RestorePoint], String) -> [RestorePoint], _ arg: String) -> [RestorePoint]{
        return clear(self.items, arg)
    }
}
