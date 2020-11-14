//
//  AirTransport.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

protocol AirTransport: Transport {
    var _speed: Double {get}
    
    func DistanceReducer(distance: Double) -> Double
}

extension AirTransport {
    var _name: String {
        return self._name
    }
    var _speed: Double {
        return self._speed
    }
    
    func Start(distance: Double) -> Double {
        return self.DistanceReducer(distance: distance) / self._speed;
    }
    
    func getName() -> String {
        return self._name
    }
}
