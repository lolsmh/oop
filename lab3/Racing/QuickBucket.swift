//
//  QuickBucket.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class QuickBucket: AirTransport {
    var _name: String = "QuickBucket"
    var _speed: Double = 8
    
    func DistanceReducer(distance: Double) -> Double {
        return distance - distance * 0.06
    }
}
