//
//  Boost.swift
//  thumbWars
//
//  Created by Robert Masen on 6/25/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Boost: BoostType {
    var id: CKRecordID {
        return self.record.recordID
    }
    var record: CKRecord
    var name: String
    var description: String
    var healthBonus: Int
    var physicalDefense: Int
    var magicResistance: Int
    var attackBonus: Int
    var physicalDamageBonus: Int
    var magicDamageBonus: Int
    var expiration: Date?
    
    init?(with record: CKRecord) {
        self.record = record
        if let name = record.object(forKey: "name") as? String,
            let description = record.object(forKey: "description") as? String,
            let healthBonus = record.object(forKey: "healthBonus") as? Int,
            let physicalDefense = record.object(forKey: "physicalDefense") as? Int,
            let magicResistance = record.object(forKey: "magicResistance") as? Int,
            let attackBonus = record.object(forKey: "attackBonus") as? Int,
            let physicalDamageBonus = record.object(forKey: "physicalDamageBonus") as? Int,
            let magicDamageBonus = record.object(forKey: "magicDamageBonus") as? Int {
            self.name = name
            self.description = description
            self.healthBonus = healthBonus
            self.physicalDefense = physicalDefense
            self.magicResistance = magicResistance
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

//extension Boost: CloudKitRepresentable {
//    func asCloudKitRecord() -> CKRecord {
//        let record = CKRecord(recordType: "ring")
//        record.setObject(name, forKey: "name")
//        record.setObject(description, forKey: "description")
//        record.setObject(physicalDefense, forKey: "physicalDefense")
//        record.setObject(magicResistance, forKey: "magicResistance")
//        record.setObject(healthBonus, forKey: "healthBonus")
//        record.setObject(attackBonus, forKey: "attackBonus")
//        record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
//        record.setObject(magicDamageBonus, forKey: "magicDamageBonuse")
//        record.setObject(expriation, forKey: "expriation")
//        return record
//    }
//}
