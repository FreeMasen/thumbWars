//
//  Items.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

protocol ItemType {
    var name: String { get }
    var description: String { get }
}

protocol HelmetType: ItemType, BoostType {
    var magicDmg: Int { get }
    var physicalDmg: Int { get }
    var damageRoll: Dice { get }
}

protocol RingType: ItemType, BoostType {
    var physicalDefense: Int { get }
    var magicResistance: Int { get }
}

protocol BoostType: ItemType {
    var healthBonus: Int { get }
    var physicalDefense: Int { get }
    var magicResistance: Int { get }
    var attackBonus: Int { get }
    var physicalDamageBonus: Int { get }
    var magicDamageBonus: Int { get }
    var expriation: Date? { get }
}

extension RingType {
    func asCloudKitRecord() -> CKRecord {
        let record = CKRecord(recordType: "ring")
        record.setObject(name, forKey: "name")
        record.setObject(description, forKey: "description")
        record.setObject(physicalDefense, forKey: "physicalDefense")
        record.setObject(magicResistance, forKey: "magicResistance")
        record.setObject(healthBonus, forKey: "healthBonus")
        record.setObject(attackBonus, forKey: "attackBonus")
        record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
        record.setObject(magicDamageBonus, forKey: "magicDamageBonuse")
        record.setObject(expriation, forKey: "expriation")
        return record
    }
}
