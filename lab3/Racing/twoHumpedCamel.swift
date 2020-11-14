//
//  twoHumpedCamel.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class TwoHumpedCamel: GroundTransport {
    var _name: String = "TwoHumpedCamel"
    var _speed: Double = 10
    var _restInterval: Double = 30
    var _isFirstRest: Bool = true
    
    func Rest() -> Double{
        if self._isFirstRest {
            self._isFirstRest = false
            return 5
        } else {
            return 8
        }
    }
}
