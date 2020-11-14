//
//  MagicCarpet.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class MagicCarpet: AirTransport {
    var _name: String = "MagicCarpet"
    var _speed: Double = 10
    
    func DistanceReducer(distance: Double) -> Double {
        if distance <= 1000 {
            return distance
        } else if distance <= 5000 {
            return distance - distance * 0.03
        } else if distance <= 10000 {
            return distance - distance * 0.1
        } else {
            return distance - distance * 0.05
        }
    }
}
