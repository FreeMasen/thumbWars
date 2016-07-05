//
//  Helmet.swift
//  thumbWars
//
//  Created by Robert Masen on 6/17/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Helmet: HelmetType {
    var record: CKRecord
    var reference: CKReference {
        return CKReference(record: record, action: .none)
    }
    //itemType
    var name: String
    var description: String
    //HelmetType
    var magicDmg: Int
    var physicalDmg: Int
    var damageRoll: Dice
    //BoostTYpe
    var healthBonus: Int
    var physicalDefense: Int
    var magicResistance: Int
    var attackBonus: Int
    var physicalDamageBonus: Int
    var magicDamageBonus: Int
    var expiration: Date?
    
    init() {
        self.record = CKRecord(recordType: "Helmet")
        self.name =  "Plain Cap"
        self.description = "very plain steel cap."
        self.magicDmg = 0
        self.physicalDmg = 0
        self.damageRoll = .d6
        self.healthBonus = 0
        self.physicalDefense = 0
        self.magicResistance = 0
        self.attackBonus = 0
        self.physicalDamageBonus = 0
        self.magicDamageBonus = 0
    }
    
    init?(with record: CKRecord) {
        self.record = record
        if let name = record.object(forKey: "name") as? String,
            let description = record.object(forKey: "description") as? String,
            let magicDmg = record.object(forKey: "magicDmg") as? Int,
            let physicalDmg = record.object(forKey: "physicalDmg") as? Int,
            let rollNumber = record.object(forKey: "damageRoll") as? Int,
            let damageRoll = Dice(rawValue: rollNumber),
            let healthBonus = record.object(forKey: "healthBonus") as? Int,
            let physicalDefense = record.object(forKey: "physicalDefense") as? Int,
            let magicResistance = record.object(forKey: "magicResistance") as? Int,
            let attackBonus = record.object(forKey: "attackBonus") as? Int,
            let physicalDamageBonus = record.object(forKey: "physicalDamageBonus") as? Int,
            let magicDamageBonus = record.object(forKey: "magicDamageBonus") as? Int {
        
            self.name = name
            self.description = description
            self.magicDmg = magicDmg
            self.physicalDmg = physicalDmg
            self.damageRoll = damageRoll
            self.healthBonus = healthBonus
            self.physicalDefense = physicalDefense
            self.magicResistance = magicResistance
            self.physicalDefense = physicalDefense
            self.attackBonus = attackBonus
            self.physicalDamageBonus = physicalDamageBonus
            self.magicDamageBonus = magicDamageBonus
            if let expiration = record.object(forKey: "expiration") as? Date {
                self.expiration = expiration
            }
        } else {
            return nil
        }
    }
}

extension Helmet: Equatable { }

func ==(lhs: Helmet, rhs: Helmet) -> Bool {
    if lhs.name == rhs.name { return true }
    return false
}
