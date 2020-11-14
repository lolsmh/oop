//
//  speedCamel.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class SpeedCamel: GroundTransport {
    var _name: String = "SpeedCamel"
    var _speed: Double = 40
    var _restInterval: Double = 10
    var _restCount: Int = 1

    func Rest() -> Double{
        if self._restCount == 1 {
            self._restCount += 1
            return 5
        } else if self._restCount == 2 {
            self._restCount += 1
            return 6.5
        } else {
            return 8
        }
    }
}
