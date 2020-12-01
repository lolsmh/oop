import Foundation

protocol IRestorePoint {
    var list: [FileRestoreCopyInfo] {get}
    var date: String {get}
    var name: String {get}
    var isFatherRestorePoint: Bool {get}
    func getSize() -> Int
    func show()
    func setAsFatherRestorePoint()
}

extension IRestorePoint {    
    func getSize() -> Int {
        var size = 0
        for i in self.list {
            size += i.Size
        }
        return size
    }
    
    func show() {
        print("\t\(self.name)\n")
        for i in self.list {
            i.show()
            print()
        }
    }
}
