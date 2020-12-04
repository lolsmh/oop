//
//  Triplet.swift
//  Bank
//
//  Created by Даниил Апальков on 04.12.2020.
//

import Foundation

class Triplet<A, B, C> {
    var first: A
    var second: B
    var third: C
    
    init(_ first: A, _ second: B, _ third: C) {
        self.first = first
        self.second = second
        self.third = third
    }
}
