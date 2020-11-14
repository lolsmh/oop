//
//  GroundTransport.swift
//  Racing
//
//  Created by Даниил Апальков on 22.10.2020.
//

protocol GroundTransport: Transport {
    var _speed: Double {get}
    var _restInterval: Double {get}
    
    func Rest() -> Double
}

extension GroundTransport {
    var _name: String {
        return self._name
    }
    var _speed: Double {
        return self._speed
    }
    var _restInterval: Double {
        return self._restInterval
    }
    
    func Start(distance: Double) -> Double {
        var time: Double = 0
        var dist: Double = 0
        
        while dist < distance{
            dist += self._speed * self._restInterval
            if dist >= distance {
                time += self._restInterval - ((dist - distance) / self._speed)
            } else {
                time += self._restInterval + self.Rest()
            }
        }
        return (time * 10).rounded() / 10
    }
    
    func getName() -> String {
        return self._name
    }
}

