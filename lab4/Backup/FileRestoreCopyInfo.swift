class FileRestoreCopyInfo {
    private(set) var Name: String;
    private(set) var Size: Int;
    private(set) var Date: String;
    
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
    
    func show() {
        print("\t\t\tName: \(self.Name)")
        print("\t\t\tSize: \(self.Size) mb")
        print("\t\t\tDate: \(self.Date)")
    }
}
