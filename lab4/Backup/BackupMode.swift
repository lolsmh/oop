class BackupMode {
    static func Separate(args: [FileInfo]) -> IRestorePoint {
        var list: [FileRestoreCopyInfo] = []
        for i in args {
            list.append(FileRestoreCopyInfo(i.Name, i.Size, MyDate.now()))
        }
        return SeparateRestorePoint(args: list)
    }
    
    static func SeparateIncremental(args: [FileInfo], fatherRestore restore: IRestorePoint) -> IRestorePoint {
        var list: [FileRestoreCopyInfo] = []
        for i in 0..<restore.list.count {
            if args[i].Size != restore.list[i].Size {
                var newSize = restore.list[i].Size - args[i].Size
                if args[i].Size > restore.list[i].Size {
                    newSize = -newSize
                }
                list.append(FileRestoreCopyInfo("\(args[i].Name)_incremental", newSize, MyDate.now()))
            }
        }
        let restore = IncrementalSeparateRestorePoint(args: list)
        return restore
    }
    
    static func InFile(args: [FileInfo]) -> IRestorePoint {
        var size = 0
        for i in args {
            size += i.Size
        }
        size = Int(Double(size) * 0.95)
        return InFileRestorePoint(args: [FileRestoreCopyInfo(size: size, name: "backup_\(MyDate.now()).rar")])
    }
    
    static func InFileIncremental(args: [FileInfo], fatherRestore restore: IRestorePoint) -> IRestorePoint {
        var size = 0
        let res: IncrementalInFileRestorePoint
        for i in args {
            size += i.Size
        }
        size = Int(Double(size) * 0.95)
        if size != restore.getSize() {
            var newSize = restore.getSize() - size
            if size > restore.getSize() {
                newSize = -newSize
            }
            res = IncrementalInFileRestorePoint(args: [FileRestoreCopyInfo(size: newSize, name: "backup_incremental_\(MyDate.now()).rar")])
            return res
        }
        return IncrementalInFileRestorePoint(args: [])
    }
}
