//
//  Source.swift
//  Racing
//
//  Created by Даниил Апальков on 23.10.2020.
//

class Source {
    
    private var _races: [Race] = []
    
    func initGroundRace(distance: Double, args: Transport...) {
        let tempRace = Race()
        for i in args {
            tempRace.RegistrateInAnGroundRace(item: i)
        }
        tempRace.setDistance(distance: distance)
        self._races.append(tempRace);
    }
    
    func initAirRace(distance: Double, args: Transport...) {
        let tempRace = Race()
        for i in args {
            tempRace.RegistrateInAnAirRace(item: i)
        }
        tempRace.setDistance(distance: distance)
        self._races.append(tempRace);
    }
    
    func initAnyRace(distance: Double, args: Transport...) {
        let tempRace = Race()
        for i in args {
            tempRace.RegistrateInAnAnyRace(item: i)
        }
        tempRace.setDistance(distance: distance)
        self._races.append(tempRace);
    }
    
    func startRace(num: Int) {
        print("В гонке №" + String(num) + ":")
        self._races[num - 1].Start()
    }
    
    func clearAll() {
        self._races.removeAll();
    }
    
    
    
    //класс гонки
    
    
    
    private class Race {
        var _list: [Transport] = []
        var _distance: Double = 0
        
        func setDistance(distance: Double) {
            self._distance = distance
        }
        
        func RegistrateInAnGroundRace(item: Transport) {
            if (item is GroundTransport) {
                _list.append(item)
            } else {
                print(item.getName() + " не был добавлен в гонку так как не является наземным транспортом")
            }
        }
        
        func RegistrateInAnAirRace(item: Transport) {
            if (item is AirTransport) {
                _list.append(item)
            } else {
                print(item.getName() + " не был добавлен в гонку так как не является воздушным транспортом")
            }
        }
        
        func RegistrateInAnAnyRace(item: Transport) {
            _list.append(item)
        }
        
        func Start() {
            var winner: String = "null"
            var min: Double = Double.infinity
            for i in _list {
                let tempResult = i.Start(distance: self._distance)
                if(tempResult < min) {
                    min = tempResult
                    winner = i.getName()
                }
            }
            if(winner != "null") {
                print("Победил " + winner + " с результатом " + String(min) + " на дистанции в " + String(self._distance))
            } else {
                print("Не было добавлено ни одного транспорта")
            }
        }
    }
}
