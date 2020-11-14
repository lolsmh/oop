//
//  Transport.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

protocol Transport {
    var _name: String {get}
    
    func Start(distance: Double) -> Double
    func getName() -> String
}
