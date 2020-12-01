import Foundation

class BackupItem {
    private(set) var items: [IRestorePoint] = []
    private(set) var name: String
    private var date = MyDate.now()
    private var backup: ([FileInfo]) -> IRestorePoint
    private var data: [FileInfo]
    private var fatherRestore: IRestorePoint?
    
    init(name: String, args: [FileInfo], mode backup: @escaping ([FileInfo]) -> IRestorePoint) {
        self.data = args
        self.items.append(backup(args))
        self.name = name
        self.backup = backup
    }
    
    func getInfo() {
        print("Name: \(self.name) ")
        print("Overall size: \(self.getSize()) mb")
        print("Creation date: \(self.date)")
        for i in self.items {
            i.show()
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
        self.items.append(self.backup(self.data))
    }
    
    func addRestorePoint(mode backup: @escaping ([FileInfo], IRestorePoint) -> IRestorePoint) throws {
        if self.items.count == 0 {
            throw IncrementalError.BackupIsEmpty()
        }
//        if self.fatherRestore == nil || !(self.items.last! is IncrementalSeparateRestorePoint) ||  {
//            self.items.last?.isFatherIncremental = true
//            self.fatherRestore = self.items.last
//        }
        if self.items.last! is IFullRestorePoint {
            if self.fatherRestore == nil { self.fatherRestore = self.items.last }
        }
        self.items.append(backup(self.data, self.fatherRestore!))
    }
    
    func clear(clear: @escaping ([IRestorePoint], String) -> [IRestorePoint], _ arg: String){
        self.items = clear(self.items, arg)
    }
    
    func clear(clear: ([IRestorePoint], Bool, String, Bool, String, Bool, String, Bool, Bool) -> [IRestorePoint],
               bySize: Bool = false, size: String = "0", byCount: Bool = false, count: String = "0", byDate: Bool = false, date: String = "0", max: Bool = false, all: Bool = false) {
        if (!bySize && !byCount) || (!byDate && !byCount) || (!byDate && !bySize) {
            print("You need to use at least 2 arguments for gybrid cleaning")
            return
        }
        self.items = clear(self.items, bySize, size, byCount, count, byDate, date, max, all)
    }
}
