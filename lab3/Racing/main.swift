//
//  main.swift
//  Racing
//
//  Created by Даниил Апальков on 22.10.2020.
//

import Foundation

var camel = TwoHumpedCamel()
var speedCamel = SpeedCamel()
var centaur = Centaur()
var boots = TravelBoots()
var carpet = MagicCarpet()
var bucket = QuickBucket()
var broom = Broom()


var src = Source()

src.initGroundRace(distance: 1000, args: camel, speedCamel, centaur)
src.initGroundRace(distance: 1000, args: camel, speedCamel, centaur)
src.initAirRace(distance: 1000, args: bucket, broom, camel)
src.initAnyRace(distance: 1000, args: bucket, broom, camel, carpet, speedCamel)

src.startRace(num: 1)
src.startRace(num: 2)
src.startRace(num: 3)
src.startRace(num: 4)
src.clearAll()
