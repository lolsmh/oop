//
//  ClearType.swift
//  Backup
//
//  Created by Даниил Апальков on 03.11.2020.
//

import Foundation

class ClearType {
    static func ByCount(data: [RestorePoint], num: String) -> [RestorePoint] {
        let num = Int(num)
        let currNum = data.count
        var newData = data
        if currNum > num! {
            newData.removeFirst(currNum - num!)
        }
        return newData;
    }
    static func ByDate(data: [RestorePoint], date: String) -> [RestorePoint] {
        var newData = data
        newData.removeAll(where: { $0.date < date })
        return newData
    }
    static func BySize(data: [RestorePoint], size: String) -> [RestorePoint] {
        var newData = data
        let newSize = Int(size)
        var currentSize = 0
        
        for i in newData {
            currentSize += i.getSize()
            if currentSize > newSize! {
                currentSize -= newData[0].getSize()
                newData.removeFirst()
            }
        }
        return newData
    }
    
    static func Gibrid (_ args: [RestorePoint], _ fun1: ([RestorePoint], String) -> [RestorePoint], _ arg1: String, _ fun2: ([RestorePoint], String) -> [RestorePoint], _ arg2: String, _ mode: String) -> [RestorePoint] {
            if mode == "all" {
                
            }
        return args
        }
    static func Gibrid (_ args: [RestorePoint], _ fun1: ([RestorePoint], String) -> [RestorePoint], _ arg1: String, _ fun2: ([RestorePoint], String) -> [RestorePoint], _ arg2: String, _ fun3: ([RestorePoint], String) -> [RestorePoint], _ arg3: String, _ mode: String) -> [RestorePoint] {
            if mode == "all" {
                
            }
        return args
        }
    
}
