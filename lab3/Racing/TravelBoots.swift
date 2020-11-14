//
//  TravelBoots.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class TravelBoots: GroundTransport {
    var _name: String = "TravelBoots"
    var _speed: Double = 6
    var _restInterval: Double = 60
    var _isFirstRest: Bool = true

    func Rest() -> Double {
        if self._isFirstRest{
            return 10
        } else {
            return 5
        }
    }
}
