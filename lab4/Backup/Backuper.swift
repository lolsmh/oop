import Foundation

class Backuper {
    private var i = 0
    func CreateBackup(args: [FileInfo], mode: @escaping ([FileInfo]) -> IRestorePoint) -> BackupItem {
        i += 1
        return BackupItem(name: "\(i) backup", args: args, mode: mode)
    }
}
