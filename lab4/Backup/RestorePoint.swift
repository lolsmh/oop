//
//  BackupList.swift
//  Backup
//
//  Created by Даниил Апальков on 04.11.2020.
//

import Foundation

class RestorePoint {
    var list: [FileRestoreCopyInfo] = []
    var name: String = "default"
    var date = MyDate.now()
    
    init(args: [FileRestoreCopyInfo]) {
        self.list = args
    }
    
    func getSize() -> Int {
        var size = 0
        for i in self.list {
            size += i.Size
        }
        return size
    }
}
