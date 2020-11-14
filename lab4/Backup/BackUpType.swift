//
//  BackUpType.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//

class BackUpType {
    static func Separate(args: [FileInfo]) -> RestorePoint {
        var list: [FileRestoreCopyInfo] = []
        for i in args {
            list.append(FileRestoreCopyInfo(i.Name, i.Size, MyDate.now()))
        }
        return RestorePoint(args: list)
    }
    static func InFile(args: [FileInfo]) -> RestorePoint {
        var size = 0
        for i in args {
            size += i.Size
        }
        size = Int(Double(size) * 0.95)
        return RestorePoint(args: [FileRestoreCopyInfo(size: size, name: "backup_\(MyDate.now()).rar")])
    }
}
