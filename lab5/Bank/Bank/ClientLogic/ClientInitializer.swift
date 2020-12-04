//
//  ClientInitializer.swift
//  Bank
//
//  Created by Даниил Апальков on 03.12.2020.
//

import Foundation

protocol IInitializer {
    
}

protocol IClientInitializer {
    func setName(_ name: String?) -> IClientInitializer
    func setSurname(_ surname: String?) -> IClientInitializer
    func setAddres(_ address: String?) -> IClientInitializer
    func setPassportNumber(_ number: String?) -> IClientInitializer
    func setAccount() -> IClientInitializer
    func build() -> Client
}

class ClientInitializer: IClientInitializer {
    func setAccount() -> IClientInitializer {
        return self
    }
    
    var info = [String : String]()
    
    func setName(_ name: String?) -> IClientInitializer {
        if self.info["name"] == nil {
            self.info["name"] = name
        }
        return self
    }
    
    func setSurname(_ surname: String?) -> IClientInitializer {
        if self.info["surname"] == nil {
            self.info["surname"] = surname
        }
        return self
    }
    
    func setAddres(_ address: String?) -> IClientInitializer {
        if self.info["address"] == nil {
            if address != "nil" {
                self.info["address"] = address
            }
        }
        return self
    }
    
    func setPassportNumber(_ passport: String?) -> IClientInitializer {
        if self.info["passport"] == nil {
            if passport != "nil" {
                self.info["passport"] = passport
            }
        }
        return self
    }
    
    func build() -> Client {
        return Client(info: self.info)
    }
}
