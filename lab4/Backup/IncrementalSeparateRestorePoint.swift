import Foundation

class IncrementalSeparateRestorePoint: IIncrementalRestorePoint {
    private(set) var list: [FileRestoreCopyInfo] = []
    private(set) var date = MyDate.now()
    private(set) var name: String
    private(set) var isFatherRestorePoint: Bool = false
    
    init(args: [FileRestoreCopyInfo]) {
        self.list = args
        self.name = "IncrementalSeparateRestorePoint_\(self.date)"
    }
    
    func setAsFatherRestorePoint() {
        self.isFatherRestorePoint = true
    }
}
