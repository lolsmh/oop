//
//  FileSystem.swift
//  Backup
//
//  Created by Даниил Апальков on 04.11.2020.
//

class FileSystem {
    private var _sysBackup: [BackupItem] = []
    private var _sysFiles: [FileInfo] = []
    private var cmd: String = "none"
    private var currentLocation = "~"
    private var currentBackup = 0
    private let backuper = Backuper()
    
    func Open() {
        repeat {
            cmd = String(readLine() ?? "")
            if cmd == "ls" {
                ls()
            } else if cmd.hasPrefix("cd") {
                cd(location: cmd)
            } else if cmd.hasPrefix("touch") {
                touch(files: String(cmd[cmd.index(cmd.firstIndex(of: " ")!, offsetBy: 1)..<cmd.endIndex]))
            } else if cmd.hasPrefix("backup") {
                backup(files: String(cmd[cmd.index(cmd.firstIndex(of: " ")!, offsetBy: 1)..<cmd.endIndex]))
            } else if cmd == "data" {
                print(self.Data())
            } else if cmd.hasPrefix("info") {
                self.info(file: cmd)
            } else if cmd == "shutdown" {
                continue
            } else if cmd.hasPrefix("rebackup") {
                self.rebackup(file: cmd)
            } else if cmd.hasPrefix("change"){
                self.change(file: cmd)
            }  else if cmd.hasPrefix("clear"){
                self.clear(file: cmd)
            } else {
                print("Unknown comand: \(cmd)")
            }
        } while cmd != "shutdown"
    }
    
    private func ls() {
        if self.currentLocation == "~" {
            print("Backup, Files")
        } else if self.currentLocation == "Files" {
            for i in self._sysFiles {
                print(i.Name)
            }
        } else {
            for i in self._sysBackup {
                print(i.name)
            }
        }
    }
    
    private func cd(location: String) {
        if location == "cd .." {
            self.currentLocation = "~"
        } else if location == "cd Backup" {
            self.currentLocation = "Backup"
        } else if location == "cd Files" {
            self.currentLocation = "Files"
        }
    }
    
    private func touch(files: String) {
        let arr = files.split(separator: " ")
        for i in 0...arr.count-1 {
            for j in self._sysFiles {
                if j.Name == arr[i] {
                    print("File \(arr[i]) allready exists")
                    continue
                }
            }
            if self.currentLocation == "Files" {
                self._sysFiles.append(FileInfo("~/Files/\(arr[i])"))
            } else {
                print("Permission denied")
            }
        }
    }
    
    private func backup(files: String) {

        var arr: [String.SubSequence] = []
        var isFileBackup: Bool = false
        if files.hasPrefix("-f") {
            arr = String(files[files.index(files.firstIndex(of: "f")!, offsetBy: 2)..<files.endIndex]).split(separator: " ")
            isFileBackup = true
        } else {
            arr = files.split(separator: " ")
        }
        var arrinf: [FileInfo] = []
        if self.currentLocation == "Files" {
            for i in 0...arr.count-1 {
                var count = 0
                for j in self._sysFiles {
                    if j.Name == arr[i] {
                        arrinf.append(j)
                        count += 1
                    }
                }
                if count == 0 {
                    print("File \(arr[i]) doesn't exist")
                    return
                }
            }
            if isFileBackup {
                self._sysBackup.append(backuper.CreateBackup(args: arrinf, mode: BackUpType.InFile))
            } else {
                self._sysBackup.append(backuper.CreateBackup(args: arrinf, mode: BackUpType.Separate))
            }
        } else {
            print("File does not exist")
        }
        print("backup created")
    }
    
    private func info(file: String) {
        let name = getName(cmd: file)
        if self.currentLocation == "Backup" {
            for i in self._sysBackup {
                if i.name == name {
                    i.getInfo()
                }
            }
        } else if self.currentLocation == "Files"{
            for i in self._sysFiles {
                if i.Name == name {
                    i.getInfo()
                }
            }
        } else {
            print("File does not exist")
        }
    }
    
    private func rebackup(file: String) {
        let name = getName(cmd: file)
        for i in self._sysBackup {
            if i.name == name {
                i.addRestorePoint()
            }
        }
    }
    
    private func change(file: String) {
        let name = getName(cmd: file)
        if self.currentLocation == "Files" {
            for i in self._sysFiles {
                if i.Name == name {
                    i.change()
                }
            }
        } else {
            print("Permission denied")
        }
    }
    
    private func rm(file: String) {
        let name = getName(cmd: file)
        if self.currentLocation == "Files" {
            for i in self._sysFiles {
                if i.Name == name {
                }
            }
        } else {
            print("Permission denied")
        }
    }
    
    private func clear(file: String) {
        var name = getName(cmd: file)
        var arg: String
        var cmd: String
        var arr: [String.SubSequence] = []
        if name.hasPrefix("-") {
            arr = String(file[file.firstIndex(of: "-")!..<file.endIndex]).split(separator: " ")
            cmd = String(arr[0])
            arg = String(arr[1])
            arr.removeFirst(2)
            name = arr.joined(separator: " ")
            for i in self._sysBackup {
                if i.name == name {
                    if cmd == "-c" {
                        i.items = i.clear(clear: ClearType.ByCount, arg)
                    } else if cmd == "-d" {
                        i.items = i.clear(clear: ClearType.ByDate, arg)
                    } else if cmd == "-s" {
                        i.items = i.clear(clear: ClearType.BySize, arg)
                    }
                }
            }
        }
    }
    
    private func getName(cmd: String) -> String {
        return String(cmd[cmd.index(cmd.firstIndex(of: " ")!, offsetBy: 1)..<cmd.endIndex])
    }
    private func Data() -> String{
        return MyDate.now()
    }
}
