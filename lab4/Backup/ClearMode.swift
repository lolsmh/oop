import Foundation

class ClearMode {
    static func ByCount(data: [IRestorePoint], num: String) -> [IRestorePoint] {
        let num = Int(num)
        var currNum = data.count
        var newData = data
        while currNum > num! {
            for i in newData.indices {
                if (!newData[i].isFatherRestorePoint) || (i + 1 <= newData.count && newData[i + 1] is IFullRestorePoint) || (i == newData.count) {
                    newData.remove(at: i)
                    currNum -= 1
                    break
                }
            }
        }
        return newData;
    }
    
    static func ByDate(data: [IRestorePoint], date: String) -> [IRestorePoint] {
        var newData = data
        var undone = true
        
        func isfatherRestoreAndCanBeCleared(at i: Int) -> Bool {
            return (newData[i].isFatherRestorePoint && newData[i].date < date && i + 1 <= newData.count - 1 && newData[i + 1] is IFullRestorePoint) || (newData[i].isFatherRestorePoint && i == newData.count - 1) || (!newData[i].isFatherRestorePoint && newData[i].date < date)
        }
        
        newData.removeAll(where: { $0.date < date && $0 is IIncrementalRestorePoint })
        var i = 0
        while undone {
            if i > newData.count - 1 {
                undone = false
                break
            }
            if isfatherRestoreAndCanBeCleared(at: i) {
                newData.remove(at: i)
                i -= 1
            }
            i += 1
        }
        return newData
    }
    static func BySize(data: [IRestorePoint], size: String) -> [IRestorePoint] {
        var newData = data
        let newSize = Int(size)
        var currentSize = 0
        
        for i in newData {
            currentSize += i.getSize()
        }
        
        while currentSize > newSize! {
            for i in 0..<newData.count {
                if (newData[i].isFatherRestorePoint && i + 1 <= newData.count - 1 && (newData[i + 1] is IFullRestorePoint)) || (newData[i].isFatherRestorePoint && i == newData.count - 1) || (!newData[i].isFatherRestorePoint) {
                    currentSize -= newData[i].getSize()
                    newData.remove(at: i)
                    break
                }
            }
        }
        return newData
    }
    
    static func Gybrid(args: [IRestorePoint], bySize isCleaningBySize: Bool, size: String, byCount isCleaningByCount: Bool, count: String, byDate isCleaningByDate: Bool, date: String, max: Bool, all: Bool) -> [IRestorePoint] {
        var needToCleanByCount = false
        var needToCleanBySize = false
        var needToCleanByDate = false
        var currSize = 0
        
        if isCleaningByCount {
            if args.count > Int(count)! {
                needToCleanByCount = true
            }
        }
        if isCleaningBySize {
            for i in args {
                currSize += i.getSize()
            }
            if currSize > Int(size)! {
                needToCleanBySize = true
            }
        }
        if isCleaningByDate {
            for i in args {
                if i.date < date {
                    needToCleanByDate = true
                    break
                }
            }
        }
        
        if all {
            if isCleaningBySize && isCleaningByDate && needToCleanBySize && needToCleanByDate {
                let dateData = self.ByDate(data: args, date: date)
                let sizeData = self.BySize(data: args, size: size)
                if max {
                    if dateData.count < sizeData.count {
                        return dateData
                    } else {
                        return sizeData
                    }
                } else {
                    if dateData.count > sizeData.count {
                        return dateData
                    } else {
                        return sizeData
                    }
                }
            } else if isCleaningBySize && isCleaningByCount && needToCleanBySize && needToCleanByCount {
                let sizeData = self.BySize(data: args, size: size)
                let countData = self.ByCount(data: args, num: count)
                if max {
                    if sizeData.count < countData.count {
                        return self.BySize(data: args, size: size)
                    } else {
                        return self.ByCount(data: args, num: count)
                    }
                } else {
                    if sizeData.count > countData.count {
                        return self.BySize(data: args, size: size)
                    } else {
                        return self.ByCount(data: args, num: count)
                    }
                }
            } else if isCleaningByCount && isCleaningByDate && needToCleanByCount && needToCleanByDate {
                let dateData = self.ByDate(data: args, date: date)
                let countData = self.ByCount(data: args, num: count)
                if max {
                    if dateData.count < countData.count {
                        return self.ByDate(data: args, date: date)
                    } else {
                        return self.ByCount(data: args, num: count)
                    }
                } else {
                    if dateData.count > countData.count {
                        return self.ByDate(data: args, date: date)
                    } else {
                        return self.ByCount(data: args, num: count)
                    }
                }
            } else if isCleaningByCount && isCleaningBySize && isCleaningByDate && needToCleanByCount && needToCleanBySize && needToCleanByDate {
                let dateData = self.ByDate(data: args, date: date)
                let countData = self.ByCount(data: args, num: count)
                let sizeData = self.BySize(data: args, size: size)
                if max {
                    if sizeData.count < dateData.count && sizeData.count < countData.count {
                        return self.BySize(data: args, size: size)
                    } else if dateData.count < sizeData.count && dateData.count < countData.count {
                        return self.ByDate(data: args, date: date)
                    } else if countData.count < dateData.count && countData.count < sizeData.count {
                        return self.ByCount(data: args, num: count)
                    }
                } else {
                    if sizeData.count > dateData.count && sizeData.count > countData.count {
                        return self.BySize(data: args, size: size)
                    } else if dateData.count > sizeData.count && dateData.count > countData.count {
                        return self.ByDate(data: args, date: date)
                    } else if countData.count > dateData.count && countData.count > sizeData.count {
                        return self.ByCount(data: args, num: count)
                    }
                }
            }
        } else {
            if isCleaningByDate && needToCleanByDate {
                return self.ByDate(data: args, date: date)
            }
            if isCleaningBySize && needToCleanBySize {
                return self.BySize(data: args, size: size)
            }
            if isCleaningByCount && needToCleanByCount {
                return self.ByCount(data: args, num: count)
            }
        }
        return args
    }
}
