//
//  Broom.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class Broom: AirTransport {
    var _name: String = "Broom"
    var _speed: Double = 20
    
    func DistanceReducer(distance: Double) -> Double {
        let reducer = (distance / 1000).rounded(FloatingPointRoundingRule.down) / 100
        return distance - distance * reducer
    }
}
