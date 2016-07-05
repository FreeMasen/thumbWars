//
//  Ring.swift
//  thumbWars
//
//  Created by Robert Masen on 6/19/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Ring: ItemType, RingType, BoostType {
    //var id: CKRecordID?
    var reference: CKReference {
        return CKReference(record: record, action: .none)
    }
    var record: CKRecord
    //itemType
    var name: String
    var description: String
    //RingType
    var physicalDefense: Int
    var magicResistance: Int
    //BoostType
    var healthBonus: Int
    var attackBonus: Int
    var physicalDamageBonus: Int
    var magicDamageBonus: Int
    var expiration: Date?
    
    init?(with record: CKRecord) {
        self.record = record
        if let name = record.object(forKey: "name") as? String,
            let description = record.object(forKey: "description") as? String,
            let physicalDefense = record.object(forKey: "physicalDefense") as? Int,
            let magicResistance = record.object(forKey: "magicResistance") as? Int,
            let healthBonus = record.object(forKey: "healthBonus") as? Int,
            let attackBonus = record.object(forKey: "attackBonus") as? Int,
            let physicalDamageBonus = record.object(forKey: "physicalDamageBonus") as? Int,
            let magicDamageBonus = record.object(forKey: "magicDamageBonus") as? Int{
            self.name = name
            self.description = description
            self.physicalDefense = physicalDefense
            self.magicResistance = magicResistance
            self.healthBonus = healthBonus
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

extension Ring: Equatable { }

func ==(lhs: Ring, rhs: Ring) -> Bool {
    if lhs.record == rhs.record { return true }
    return false
}
