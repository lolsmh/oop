class FileInfo {
    private(set) var Path: String
    private(set) var Size: Int
    private(set) var Name: String
    
    init(_ filePath: String) {
        self.Path = filePath
        self.Size = Int.random(in: 0...100)
        self.Name = String(filePath[filePath.index(filePath.lastIndex(of: "/")!, offsetBy: 1)..<filePath.endIndex])
    }
    
    func getInfo() {
        print("Name: \(self.Name)")
        print("Size: \(self.Size) mb")
    }
    
    func change() {
        self.Size = Int.random(in: 0...100)
    }

}
