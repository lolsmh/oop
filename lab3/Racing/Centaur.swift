//
//  Centaur.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class Centaur: GroundTransport {
    var _name: String = "Centaur"
    var _speed: Double = 15
    var _restInterval: Double = 8
    
    func Rest() -> Double{
        return 2
    }
}
