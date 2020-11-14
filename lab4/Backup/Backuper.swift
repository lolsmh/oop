//
//  Backuper.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//

import Foundation

class Backuper {
    private var i = 0
    func CreateBackup(args: [FileInfo], mode: @escaping ([FileInfo]) -> RestorePoint) -> BackupItem {
        i += 1
        return BackupItem(name: "\(i) backup", args: args, mode: mode)
    }
}
