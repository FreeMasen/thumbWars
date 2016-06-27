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
    var id: CKRecordID?
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
    var expriation: Date?
}

extension Helmet: Equatable { }

func ==(lhs: Helmet, rhs: Helmet) -> Bool {
    if lhs.name == rhs.name { return true }
    return false
}

extension Helmet: CloudKitRepresentable {
    func asCloudKitRecord() -> CKRecord {
        let record = CKRecord(recordType: "helmet")
        record.setObject(name, forKey: "name")
        record.setObject(description, forKey: "desciption")
        record.setObject(magicDmg, forKey: "magicDamage")
        record.setObject(physicalDmg, forKey: "physicalDamage")
        record.setObject(damageRoll.rawValue, forKey: "damageRoll")
        record.setObject(healthBonus, forKey: "healthBonus")
        record.setObject(physicalDefense, forKey: "defense")
        record.setObject(magicResistance, forKey: "resistance")
        record.setObject(attackBonus, forKey: "attackBonus")
        record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
        record.setObject(magicDamageBonus, forKey: "magicDamageBonus")
        record.setObject(expriation, forKey: "expiration")
        return record
    }
}
